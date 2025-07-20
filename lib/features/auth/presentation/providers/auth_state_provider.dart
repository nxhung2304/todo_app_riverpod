import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/models/auth_status.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/core/models/result.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';
import 'package:learn_riverpod/features/auth/data/models/requests/login_request.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';
import 'package:learn_riverpod/features/auth/data/providers/auth_repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

// features/auth/presentation/providers/auth_provider.dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthStatus> build() async {
    final storedTokens = await ref.watch(tokenStorageServiceProvider.future);

    if (storedTokens == null) {
      return const AuthStatus.unauthenticated();
    }

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final userResult = await authRepo.validateToken();

      // Fix: Consistent type checking
      if (userResult is Success<User>) {
        final user = userResult.data;
        if (user != null) {
          return AuthStatus.authenticated(user);
        }
      }
    } catch (e) {
      print('Error in build: $e'); // Debug log
      return const AuthStatus.unauthenticated();
    }

    return const AuthStatus.unauthenticated();
  }

  Future<void> login({required String email, required String password}) async {
    print('=== Login started ===');
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final loginRequest = LoginRequest(email: email, password: password);
      final result = await authRepo.login(loginRequest);
      
      print('Login result type: ${result.runtimeType}');
      print('Login result: $result');

      if (result is Success<AuthTokens>) {
        final tokens = result.data;
        print('Tokens received: $tokens');
        
        if (tokens != null) {
          await ref.read(tokenStorageServiceProvider.notifier).saveTokens(tokens);
          print('Tokens saved successfully');
          
          // Get user info
          final userResult = await authRepo.validateToken();
          print('User result type: ${userResult.runtimeType}');
          
          if (userResult is Success<User>) { // Same as build method
            final user = userResult.data;
            if (user != null) {
              print('User authenticated: ${user.email}');
              state = AsyncValue.data(AuthStatus.authenticated(user));
            } else {
              print('User data is null');
              state = AsyncValue.data(AuthStatus.error('User data is null'));
            }
          } else {
            print('Failed to get user info');
            state = AsyncValue.data(AuthStatus.error('Failed to get user information'));
          }
        } else {
          print('Tokens are null');
          state = AsyncValue.data(AuthStatus.error('Invalid tokens received'));
        }
      } else {
        print('Login failed - not Success type');
        // Handle error cases
        String errorMessage = 'Login failed';
        if (result.isError) {
          errorMessage = result.error ?? 'Unknown error';
        }
        state = AsyncValue.data(AuthStatus.error(errorMessage));
      }
    } catch (e, stackTrace) {
      print('Login exception: $e');
      print('Stack trace: $stackTrace');
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
    
    print('=== Login completed ===');
  }

  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
    String? confirmPassword,
  }) async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      if (confirmPassword != null && password != confirmPassword) {
        state = AsyncValue.data(AuthStatus.error('Passwords do not match'));
        return;
      }

      final authRepo = ref.read(authRepositoryProvider);
      final result = await authRepo.signup(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (result is Success) {
        // Auto login after successful signup
        await login(email: email, password: password);
      } else {
        String errorMessage = 'Signup failed';
        if (result.isError) {
          errorMessage = result.error ?? 'Signup failed';
        }
        state = AsyncValue.data(AuthStatus.error(errorMessage));
      }
    } catch (e) {
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      await ref.read(authRepositoryProvider).logout();
      await ref.read(tokenStorageServiceProvider.notifier).clearTokens();
      state = const AsyncValue.data(AuthStatus.unauthenticated());
    } catch (e) {
      // Force logout even on error
      await ref.read(tokenStorageServiceProvider.notifier).clearTokens();
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
  }
}
