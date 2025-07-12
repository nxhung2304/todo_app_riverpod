// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_todo_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editTodoFormHash() => r'e24eb5c180424e5a0b0ffed1e349fbc57e18c8ac';

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

abstract class _$EditTodoForm
    extends BuildlessAutoDisposeNotifier<TodoFormState> {
  late final Todo? initialTodo;

  TodoFormState build(Todo? initialTodo);
}

/// See also [EditTodoForm].
@ProviderFor(EditTodoForm)
const editTodoFormProvider = EditTodoFormFamily();

/// See also [EditTodoForm].
class EditTodoFormFamily extends Family<TodoFormState> {
  /// See also [EditTodoForm].
  const EditTodoFormFamily();

  /// See also [EditTodoForm].
  EditTodoFormProvider call(Todo? initialTodo) {
    return EditTodoFormProvider(initialTodo);
  }

  @override
  EditTodoFormProvider getProviderOverride(
    covariant EditTodoFormProvider provider,
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
  String? get name => r'editTodoFormProvider';
}

/// See also [EditTodoForm].
class EditTodoFormProvider
    extends AutoDisposeNotifierProviderImpl<EditTodoForm, TodoFormState> {
  /// See also [EditTodoForm].
  EditTodoFormProvider(Todo? initialTodo)
    : this._internal(
        () => EditTodoForm()..initialTodo = initialTodo,
        from: editTodoFormProvider,
        name: r'editTodoFormProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$editTodoFormHash,
        dependencies: EditTodoFormFamily._dependencies,
        allTransitiveDependencies:
            EditTodoFormFamily._allTransitiveDependencies,
        initialTodo: initialTodo,
      );

  EditTodoFormProvider._internal(
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
  TodoFormState runNotifierBuild(covariant EditTodoForm notifier) {
    return notifier.build(initialTodo);
  }

  @override
  Override overrideWith(EditTodoForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditTodoFormProvider._internal(
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
  AutoDisposeNotifierProviderElement<EditTodoForm, TodoFormState>
  createElement() {
    return _EditTodoFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditTodoFormProvider && other.initialTodo == initialTodo;
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
mixin EditTodoFormRef on AutoDisposeNotifierProviderRef<TodoFormState> {
  /// The parameter `initialTodo` of this provider.
  Todo? get initialTodo;
}

class _EditTodoFormProviderElement
    extends AutoDisposeNotifierProviderElement<EditTodoForm, TodoFormState>
    with EditTodoFormRef {
  _EditTodoFormProviderElement(super.provider);

  @override
  Todo? get initialTodo => (origin as EditTodoFormProvider).initialTodo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
