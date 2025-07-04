import 'package:todo_app_riverpod/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:todo_app_riverpod/features/auth/data/models/user_model.dart';

import '../../domain/entities/auth_status_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  
  AuthRepositoryImpl({
    required FirebaseAuthDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Stream<AuthStatusEntity> get authStateChanges {
    return _remoteDataSource.authStateChanges.map((firebaseUser) {
      if (firebaseUser == null) {
        return AuthStatusEntity(status: AuthStatus.unauthenticated);
      } else {
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        return AuthStatusEntity(
          status: AuthStatus.authenticated,
          user: userModel.toEntity(),
        );
      }
    });
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final firebaseUser = _remoteDataSource.currentUser;
      if (firebaseUser == null) return null;
      
      final userModel = UserModel.fromFirebaseUser(firebaseUser);
      
      await _localDataSource.saveUser(userModel);
      
      return userModel.toEntity();
    } catch (e) {
      final cachedUser = await _localDataSource.getCachedUser();
      return cachedUser?.toEntity();
    }
  }

  @override
  Future<UserEntity> signInWithEmailAndPassword(String email, String password) async {
    final userModel = await _remoteDataSource.signInWithEmailAndPassword(email, password);
    await _localDataSource.saveUser(userModel);
    return userModel.toEntity();
  }
  
  @override
  Future<UserEntity> createUserWithEmailAndPassword(String email, String password) async {
    final userModel = await _remoteDataSource.createUserWithEmailAndPassword(email, password);
    return userModel.toEntity();
  }
  
  @override
  Future<void> sendEmailVerification() async {
    await _remoteDataSource.sendEmailVerification();
  }
  
  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _remoteDataSource.sendPasswordResetEmail(email);
  }
  
  @override
  Future<void> signOut() async {
    _remoteDataSource.signOut();
  }
  
  @override
  Future<void> updateProfile({String? displayName, String? photoURL}) async {
    await _remoteDataSource.updateProfile(displayName: displayName, photoURL: photoURL);
  }
}
