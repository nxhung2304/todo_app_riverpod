import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app_riverpod/features/auth/presentation/providers/auth_repository_provider.dart';
import '../../domain/entities/auth_status_entity.dart';

part 'auth_state_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  Stream<AuthStatusEntity> build() {
    final repository = ref.read(authRepositoryProvider);
    return repository.authStateChanges;
  }
}

// Derived providers
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (data) => data.status == AuthStatus.authenticated,
    loading: () => false,
    error: (_, __) => false,
  );
}

@riverpod
UserEntity? currentUser(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (data) => data.user,
    loading: () => null,
    error: (_, __) => null,
  );
}
