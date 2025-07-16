import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthRemoteDatasource {
  Future<firebase_auth.User> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebase_auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return credential.user!;
      } else {
        throw Exception('No user found');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e.code));
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<firebase_auth.User> signup(
    String fullName, {
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        return credential.user!;
      } else {
        throw Exception('No user found');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e.code));
    } catch (e) {
      throw Exception("Cannot signOut by FirebaseAuth");
    }
  }

  Future<void> logout() async {
    try {
      await firebase_auth.FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception("Cannot signOut by FirebaseAuth");
    }
  }

  String _mapFirebaseError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Invalid email or password';
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many failed attempts. Try again later';
      case 'weak-password':
        return 'Password is too weak';
      case 'email-already-in-use':
        return 'Email is already registered';
      default:
        return 'Authentication failed: $errorCode';
    }
  }
}
