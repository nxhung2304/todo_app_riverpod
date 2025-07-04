// lib/core/config/firebase_config.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseConfig {
  static String _getEnv(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw Exception('Missing required environment variable: $key');
    }
    return value;
  }

  static FirebaseOptions get android => FirebaseOptions(
    apiKey: _getEnv('ANDROID_API_KEY'),
    appId: '1:772511266335:ios:53821b415e1986aad8072a',
    messagingSenderId: '772511266335',
    projectId: 'todo-app-riverpod-98e77',
    storageBucket: 'todo-app-riverpod-98e77.firebasestorage.app', 
  );

  static FirebaseOptions get ios => FirebaseOptions(
    apiKey: _getEnv('IOS_API_KEY'),
    appId: '1:772511266335:ios:53821b415e1986aad8072a',
    messagingSenderId: '772511266335',
    projectId: 'todo-app-riverpod-98e77',
    storageBucket: 'todo-app-riverpod-98e77.firebasestorage.app',
    iosBundleId: 'com.example.todoAppRiverpod',
  );
}
