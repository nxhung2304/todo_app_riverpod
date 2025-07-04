import 'package:todo_app_riverpod/features/auth/domain/entities/user_entity.dart';

enum AuthStatus {
  unknown,
  loading,
  authenticated,
  unauthenticated,
}

class AuthStatusEntity {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;
  final bool isLoading;

  const AuthStatusEntity({
    required this.status,
    this.user,
    this.errorMessage,
    this.isLoading = false,
  });
}
