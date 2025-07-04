import 'package:todo_app_riverpod/features/auth/domain/entities/auth_status_entity.dart';
import 'package:todo_app_riverpod/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Stream<AuthStatusEntity> get authStateChanges;
  Future<UserEntity?> getCurrentUser();
  
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
  Future<UserEntity> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  
  Future<void> updateProfile({String? displayName, String? photoURL});
}
