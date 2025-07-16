import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/services/storage_service.dart';

part 'storage_provider.g.dart';

@riverpod
StorageService storageService(Ref ref) {
  return StorageService();
}
