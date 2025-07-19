import 'package:learn_riverpod/core/utils/result.dart';
import 'package:learn_riverpod/features/auth/data/providers/auth_repository_providers.dart';
import 'package:learn_riverpod/features/auth/presentation/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    _checkCurrentUser();
    return const AuthState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.login(email: email, password: password);

      result.when(
        success: (user) {
          state = AuthState.authenticated(user);
        },
        failure: (message, exception) {
          state = AuthState.error(message);
        },
      );
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signup( String fullName, { required String email, required String password, }) async { state = const AuthState.loading(); try {
      final repository = ref.read(authRepositoryProvider);
      await repository.signup(fullName, email: email, password: password);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    try {
      await ref.read(authRepositoryProvider).logout();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> _checkCurrentUser() async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.getCurrentUser();

    if (user != null) {
      state = AuthState.authenticated(user);
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}
