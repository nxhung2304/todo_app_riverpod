// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'166956008c1048283d4d9b311257303bd44bbb33';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CategoryController
    extends BuildlessAutoDisposeNotifier<CategoryFormState> {
  late final String? categoryId;

  CategoryFormState build(String? categoryId);
}

/// See also [CategoryController].
@ProviderFor(CategoryController)
const categoryControllerProvider = CategoryControllerFamily();

/// See also [CategoryController].
class CategoryControllerFamily extends Family<CategoryFormState> {
  /// See also [CategoryController].
  const CategoryControllerFamily();

  /// See also [CategoryController].
  CategoryControllerProvider call(String? categoryId) {
    return CategoryControllerProvider(categoryId);
  }

  @override
  CategoryControllerProvider getProviderOverride(
    covariant CategoryControllerProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryControllerProvider';
}

/// See also [CategoryController].
class CategoryControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<CategoryController, CategoryFormState> {
  /// See also [CategoryController].
  CategoryControllerProvider(String? categoryId)
    : this._internal(
        () => CategoryController()..categoryId = categoryId,
        from: categoryControllerProvider,
        name: r'categoryControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$categoryControllerHash,
        dependencies: CategoryControllerFamily._dependencies,
        allTransitiveDependencies:
            CategoryControllerFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  CategoryControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String? categoryId;

  @override
  CategoryFormState runNotifierBuild(covariant CategoryController notifier) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(CategoryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryControllerProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CategoryController, CategoryFormState>
  createElement() {
    return _CategoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryControllerProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryControllerRef
    on AutoDisposeNotifierProviderRef<CategoryFormState> {
  /// The parameter `categoryId` of this provider.
  String? get categoryId;
}

class _CategoryControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CategoryController,
          CategoryFormState
        >
    with CategoryControllerRef {
  _CategoryControllerProviderElement(super.provider);

  @override
  String? get categoryId => (origin as CategoryControllerProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
