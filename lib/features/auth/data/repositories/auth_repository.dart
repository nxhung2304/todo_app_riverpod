import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:learn_riverpod/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({required this.authLocalDataSource});

  Future<void> signup(
    String fullName, {
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(credential);

      if (credential.user != null) {
        final user = User.toUser(credential.user!);
        authLocalDataSource.saveCurrentUser(user);
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User> login({required String email, required String password}) async {
    try {
      final credential = await firebase_auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        final user = User.toUser(credential.user!);
        await authLocalDataSource.saveCurrentUser(user);

        return user;
      } else {
        throw Exception('No user found');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided.');
        case 'invalid-email':
          throw Exception('The email address is not valid.');
        case 'user-disabled':
          throw Exception('This user has been disabled.');
        case 'too-many-requests':
          throw Exception('Too many failed attempts. Please try again later.');
        case 'invalid-credential':
          throw Exception('Invalid email or password.');
        default:
          throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> logout() async {
    try {
      await firebase_auth.FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception("Cannot signOut by FirebaseAuth");
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final savedUser = await authLocalDataSource.getCurrentUser();
      if (savedUser == null) {
        return null;
      }

      return savedUser;
    } catch (e) {
      throw Exception("Erorr: $e");
    }
  }
}
