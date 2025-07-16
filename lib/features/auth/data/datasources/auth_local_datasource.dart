import 'package:learn_riverpod/core/constants/storage_keys.dart';
import 'package:learn_riverpod/core/extensions/storage_extension.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthLocalDataSource {
  final StorageService storageService;

  AuthLocalDataSource({required this.storageService});

  Future<bool> saveCurrentUser(User user) async {
    return storageService.saveModel(
      StorageKeys.currentUser,
      user,
      (u) => u.toJson(),
    );
  }

  Future<User?> getCurrentUser() async {
    return storageService.getModel(StorageKeys.currentUser, User.fromJson);
  }

  Future<void> removeCurrentUser() async {
    await storageService.remove(StorageKeys.currentUser);
  }
}
