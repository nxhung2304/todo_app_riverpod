// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'18defc72b3cccb7611d73c716bca26247abac9be';

/// See also [Counter].
@ProviderFor(Counter)
final counterProvider =
    AutoDisposeNotifierProvider<Counter, CounterModel>.internal(
      Counter.new,
      name: r'counterProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Counter = AutoDisposeNotifier<CounterModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
