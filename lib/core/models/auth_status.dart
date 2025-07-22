import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initialize() = _Initialized;
  const factory AuthStatus.loading() = _Loading;
  const factory AuthStatus.authenticated(User user) = _Authenticated;
  const factory AuthStatus.unauthenticated() = _Unauthenticated;
  const factory AuthStatus.error(String message) = _Error;
}
