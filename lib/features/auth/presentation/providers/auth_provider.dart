import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/models/auth_status.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';
import 'package:learn_riverpod/features/auth/data/models/params/login_params.dart';
import 'package:learn_riverpod/features/auth/data/models/responses/google_login_response.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';
import 'package:learn_riverpod/features/auth/data/providers/auth_repository_providers.dart';
import 'package:learn_riverpod/features/auth/data/services/google_signin_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthStatus> build() async {
    final storedTokens = await ref.watch(tokenStorageServiceProvider.future);
    if (storedTokens == null) {
      print('No stored tokens, returning unauthenticated');
      return const AuthStatus.unauthenticated();
    }

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final userResult = await authRepo.validateToken();

      if (userResult is ApiSuccess<User>) {
        final user = userResult.data;
        print('User from build validateToken: $user');
        print('Returning authenticated from build');
        return AuthStatus.authenticated(user);
      }
    } catch (e) {
      print('Error in build validateToken: $e');
      return const AuthStatus.unauthenticated();
    }

    print('Returning unauthenticated from build');
    return const AuthStatus.unauthenticated();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final loginParams = LoginParams(email: email, password: password);
      final authTokens = await authRepo.login(loginParams);

      if (authTokens.data != null) {
        await ref
            .read(tokenStorageServiceProvider.notifier)
            .saveTokens(authTokens.data!);
      }

      final userResult = await authRepo.validateToken();

      if (userResult is ApiSuccess<User>) {
        final user = userResult.data;

        state = AsyncValue.data(AuthStatus.authenticated(user));
      } else if (userResult is ApiError<User>) {
        state = AsyncValue.data(
          AuthStatus.error(userResult.error ?? 'Unknown error'),
        );
      }
    } catch (e) {
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
  }

  Future<ApiResponse> signup({
    required String fullName,
    required String email,
    required String password,
    String? confirmPassword,
  }) async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      if (confirmPassword != null && password != confirmPassword) {
        state = AsyncValue.data(AuthStatus.error('Passwords do not match'));
        return ApiResponse.error('Passwords do not match');
      }

      final authRepo = ref.read(authRepositoryProvider);
      final result = await authRepo.signup(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (result.isSuccess) {
        state = const AsyncValue.data(AuthStatus.unauthenticated());
        return ApiResponse.success('Signup successfully');
      } else if (result.isError) {
        state = AsyncValue.data(
          AuthStatus.error(result.error ?? 'Signup failed'),
        );
        return ApiResponse.error(result.error ?? 'Signup failed');
      }
    } catch (e) {
      state = AsyncValue.data(AuthStatus.error(e.toString()));
      return ApiResponse.error(e.toString());
    }

    return ApiResponse.error('Signup failed');
  }

  Future<void> logout() async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      await ref.read(authRepositoryProvider).logout();
      await ref.read(tokenStorageServiceProvider.notifier).clearTokens();

      ref.read(apiClientProvider).clearAuthHeaders();

      state = const AsyncValue.data(AuthStatus.unauthenticated());
    } catch (e) {
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.data(AuthStatus.loading());

    try {
      final GoogleSignInAccount? account = await GoogleSigninService().signIn();

      if (account != null) {
        final idToken = account.authentication.idToken;
        if (idToken != null && idToken.isNotEmpty) {
          final response = await ref
              .read(authRepositoryProvider)
              .verifyGoogleToken(idToken: idToken);
          if (response is ApiSuccess<GoogleLoginResponse>) {
            final googleResponse = response.data;
            final tokens = googleResponse.authTokens;
            final user = googleResponse.user;
            await ref
                .read(tokenStorageServiceProvider.notifier)
                .saveTokens(tokens);

            state = AsyncValue.data(AuthStatus.authenticated(user));
          }
        } else {
          state = AsyncValue.data(AuthStatus.unauthenticated());
        }
      } else {
        state = AsyncValue.data(AuthStatus.unauthenticated());
      }
    } catch (e) {
      state = AsyncValue.data(AuthStatus.error(e.toString()));
    }
  }
}
