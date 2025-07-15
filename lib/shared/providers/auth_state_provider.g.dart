// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateHash() => r'7aa50e6ae5d4572bbc9fb4150e27a82c9bc408ef';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = AutoDisposeFutureProvider<User?>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateRef = AutoDisposeFutureProviderRef<User?>;
String _$authActionsHash() => r'5fd61cdde8920e09a7d009f8e0d2883d42b5c975';

/// See also [AuthActions].
@ProviderFor(AuthActions)
final authActionsProvider =
    AutoDisposeNotifierProvider<AuthActions, void>.internal(
      AuthActions.new,
      name: r'authActionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$authActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
