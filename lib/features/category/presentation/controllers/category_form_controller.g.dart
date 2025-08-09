// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryFormControllerHash() =>
    r'64f5fe2b4d2771948d3e6e9b75596641daf9031a';

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

abstract class _$CategoryFormController
    extends BuildlessAutoDisposeNotifier<CategoryFormState> {
  late final String? categoryId;

  CategoryFormState build(String? categoryId);
}

/// See also [CategoryFormController].
@ProviderFor(CategoryFormController)
const categoryFormControllerProvider = CategoryFormControllerFamily();

/// See also [CategoryFormController].
class CategoryFormControllerFamily extends Family<CategoryFormState> {
  /// See also [CategoryFormController].
  const CategoryFormControllerFamily();

  /// See also [CategoryFormController].
  CategoryFormControllerProvider call(String? categoryId) {
    return CategoryFormControllerProvider(categoryId);
  }

  @override
  CategoryFormControllerProvider getProviderOverride(
    covariant CategoryFormControllerProvider provider,
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
  String? get name => r'categoryFormControllerProvider';
}

/// See also [CategoryFormController].
class CategoryFormControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CategoryFormController,
          CategoryFormState
        > {
  /// See also [CategoryFormController].
  CategoryFormControllerProvider(String? categoryId)
    : this._internal(
        () => CategoryFormController()..categoryId = categoryId,
        from: categoryFormControllerProvider,
        name: r'categoryFormControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$categoryFormControllerHash,
        dependencies: CategoryFormControllerFamily._dependencies,
        allTransitiveDependencies:
            CategoryFormControllerFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  CategoryFormControllerProvider._internal(
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
  CategoryFormState runNotifierBuild(
    covariant CategoryFormController notifier,
  ) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(CategoryFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryFormControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<CategoryFormController, CategoryFormState>
  createElement() {
    return _CategoryFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryFormControllerProvider &&
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
mixin CategoryFormControllerRef
    on AutoDisposeNotifierProviderRef<CategoryFormState> {
  /// The parameter `categoryId` of this provider.
  String? get categoryId;
}

class _CategoryFormControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CategoryFormController,
          CategoryFormState
        >
    with CategoryFormControllerRef {
  _CategoryFormControllerProviderElement(super.provider);

  @override
  String? get categoryId =>
      (origin as CategoryFormControllerProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
