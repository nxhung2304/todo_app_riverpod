// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_todo_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editTodoFormControllerHash() =>
    r'7d5bc89c0958363f0e604f0b316d56f823caf555';

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

abstract class _$EditTodoFormController
    extends BuildlessAutoDisposeNotifier<TodoFormState> {
  late final Todo? initialTodo;

  TodoFormState build(Todo? initialTodo);
}

/// See also [EditTodoFormController].
@ProviderFor(EditTodoFormController)
const editTodoFormControllerProvider = EditTodoFormControllerFamily();

/// See also [EditTodoFormController].
class EditTodoFormControllerFamily extends Family<TodoFormState> {
  /// See also [EditTodoFormController].
  const EditTodoFormControllerFamily();

  /// See also [EditTodoFormController].
  EditTodoFormControllerProvider call(Todo? initialTodo) {
    return EditTodoFormControllerProvider(initialTodo);
  }

  @override
  EditTodoFormControllerProvider getProviderOverride(
    covariant EditTodoFormControllerProvider provider,
  ) {
    return call(provider.initialTodo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editTodoFormControllerProvider';
}

/// See also [EditTodoFormController].
class EditTodoFormControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<EditTodoFormController, TodoFormState> {
  /// See also [EditTodoFormController].
  EditTodoFormControllerProvider(Todo? initialTodo)
    : this._internal(
        () => EditTodoFormController()..initialTodo = initialTodo,
        from: editTodoFormControllerProvider,
        name: r'editTodoFormControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$editTodoFormControllerHash,
        dependencies: EditTodoFormControllerFamily._dependencies,
        allTransitiveDependencies:
            EditTodoFormControllerFamily._allTransitiveDependencies,
        initialTodo: initialTodo,
      );

  EditTodoFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialTodo,
  }) : super.internal();

  final Todo? initialTodo;

  @override
  TodoFormState runNotifierBuild(covariant EditTodoFormController notifier) {
    return notifier.build(initialTodo);
  }

  @override
  Override overrideWith(EditTodoFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditTodoFormControllerProvider._internal(
        () => create()..initialTodo = initialTodo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialTodo: initialTodo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EditTodoFormController, TodoFormState>
  createElement() {
    return _EditTodoFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditTodoFormControllerProvider &&
        other.initialTodo == initialTodo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialTodo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EditTodoFormControllerRef
    on AutoDisposeNotifierProviderRef<TodoFormState> {
  /// The parameter `initialTodo` of this provider.
  Todo? get initialTodo;
}

class _EditTodoFormControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          EditTodoFormController,
          TodoFormState
        >
    with EditTodoFormControllerRef {
  _EditTodoFormControllerProviderElement(super.provider);

  @override
  Todo? get initialTodo =>
      (origin as EditTodoFormControllerProvider).initialTodo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
