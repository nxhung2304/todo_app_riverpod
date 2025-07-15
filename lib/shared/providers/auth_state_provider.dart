import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';
import 'package:learn_riverpod/features/auth/presentation/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

@riverpod
Future<User?> authState(Ref ref) async {
  print("🔄 AuthState: Checking authentication...");

  final hasSession = await _checkExistingSession();

  if (hasSession) {
    final user = User(
      name: "Cached User",
      email: "cached@example.com",
      password: "123",
    );

    print("AuthState: Found existing session for ${user.email}");
    return user;
  }

  print("AuthState: No existing session found");
  return null;
}

Future<bool> _checkExistingSession() async {
  return false;
}

@riverpod
class AuthActions extends _$AuthActions {
  @override
  void build() {}

  Future<void> login({required String email, required String password}) async {
    print("Login");
    try {
      await AuthRepository().login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signup(
    String fullName, {
    required String email,
    required String password,
  }) async {
    print("Signup");

    try {
      await AuthRepository().signup(fullName, email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout(Ref ref) async {
    print("Logout");
  }

  Future<void> _saveSession(User user) async {
    print("Session saved for ${user.email}");
  }

  Future<void> _clearSession() async {
    print("Session cleared");
  }
}
