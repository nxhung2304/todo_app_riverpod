import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/storage_service.dart';

part 'storage_providers.g.dart';

@riverpod
StorageService storageService(Ref ref) {
  return StorageService.instance;
}
