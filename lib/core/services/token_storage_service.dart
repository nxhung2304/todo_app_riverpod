import 'dart:convert';

import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage_service.g.dart';

@riverpod
class TokenStorageService extends _$TokenStorageService {
  static const String _tokenKey = 'auth_tokens';

  @override
  Future<AuthTokens?> build() async {
    await _loadTokens();
    return null;
  }

  AuthTokens? get currentTokens {
    return state.valueOrNull;
  }

  Future<void> saveTokens(AuthTokens tokens) async {
    try {
      final storage = ref.read(storageServiceProvider);
      final tokenJson = jsonEncode(tokens.toJson());
      await storage.setString(_tokenKey, tokenJson);
    } catch (e) {
      print('Error saving tokens: $e');
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> clearTokens() async {
    try {
      final storage = ref.read(storageServiceProvider);
      await storage.remove(_tokenKey);

      state = const AsyncData(null);
      print("Token cleared");
    } catch (e) {
      print("Error clearing token: $e");
    }
  }

  // MARK: private methods

  Future<AuthTokens?> _loadTokens() async {
    final storage = ref.read(storageServiceProvider);
    final tokenString = await storage.getString(_tokenKey);

    if (tokenString != null && tokenString.isNotEmpty) {
      final tokenJson = jsonDecode(tokenString) as Map<String, dynamic>;
      final tokens = AuthTokens.fromJson(tokenJson);
      if (_isTokenValid(tokens)) {
        return tokens;
      } else {
        await clearTokens();
        return null;
      }
    }
    return null;
  }

  bool _isTokenValid(AuthTokens tokens) {
    final expiryDate = DateTime.fromMillisecondsSinceEpoch(
      tokens.expiry * 1000,
    );
    final now = DateTime.now();

    return now.isBefore(expiryDate);
  }
}
