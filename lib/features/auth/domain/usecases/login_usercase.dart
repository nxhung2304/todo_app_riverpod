import 'package:todo_app_riverpod/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app_riverpod/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  
  LoginUseCase(this.repository);
  
  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    // Validation logic
    if (email.isEmpty || !_isValidEmail(email)) {
      throw InvalidEmailException();
    }
    
    if (password.isEmpty || password.length < 6) {
      throw WeakPasswordException();
    }
    
    // Call repository
    return await repository.signInWithEmailAndPassword(email, password);
  }
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

class WeakPasswordException {
}

class InvalidEmailException {
}
