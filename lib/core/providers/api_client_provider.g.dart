// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiClientConfigHash() => r'e904915991f7f5477df793cadc833e21494d6201';

/// See also [apiClientConfig].
@ProviderFor(apiClientConfig)
final apiClientConfigProvider = AutoDisposeProvider<ApiClientConfig>.internal(
  apiClientConfig,
  name: r'apiClientConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$apiClientConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiClientConfigRef = AutoDisposeProviderRef<ApiClientConfig>;
String _$apiClientHash() => r'ec51e2a9a2b8304ec808e6b25f7d1581ff3fb019';

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

/// See also [apiClient].
@ProviderFor(apiClient)
const apiClientProvider = ApiClientFamily();

/// See also [apiClient].
class ApiClientFamily extends Family<ApiClient> {
  /// See also [apiClient].
  const ApiClientFamily();

  /// See also [apiClient].
  ApiClientProvider call(String baseUrl) {
    return ApiClientProvider(baseUrl);
  }

  @override
  ApiClientProvider getProviderOverride(covariant ApiClientProvider provider) {
    return call(provider.baseUrl);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'apiClientProvider';
}

/// See also [apiClient].
class ApiClientProvider extends AutoDisposeProvider<ApiClient> {
  /// See also [apiClient].
  ApiClientProvider(String baseUrl)
    : this._internal(
        (ref) => apiClient(ref as ApiClientRef, baseUrl),
        from: apiClientProvider,
        name: r'apiClientProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$apiClientHash,
        dependencies: ApiClientFamily._dependencies,
        allTransitiveDependencies: ApiClientFamily._allTransitiveDependencies,
        baseUrl: baseUrl,
      );

  ApiClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.baseUrl,
  }) : super.internal();

  final String baseUrl;

  @override
  Override overrideWith(ApiClient Function(ApiClientRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: ApiClientProvider._internal(
        (ref) => create(ref as ApiClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ApiClient> createElement() {
    return _ApiClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiClientProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApiClientRef on AutoDisposeProviderRef<ApiClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _ApiClientProviderElement extends AutoDisposeProviderElement<ApiClient>
    with ApiClientRef {
  _ApiClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as ApiClientProvider).baseUrl;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
