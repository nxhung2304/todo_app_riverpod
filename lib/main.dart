import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/app.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';

void injection() async{
  await StorageService().init();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  injection();

  runApp(ProviderScope(child: App()));
}
