// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeProviderNewHash() => r'2de01bcd6e38cdbcb4a3d0e1727a04943bea5e0e';

/// See also [recipeProviderNew].
@ProviderFor(recipeProviderNew)
final recipeProviderNewProvider = AutoDisposeProvider<String>.internal(
  recipeProviderNew,
  name: r'recipeProviderNewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recipeProviderNewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecipeProviderNewRef = AutoDisposeProviderRef<String>;
String _$getRecipesHash() => r'2f5c914cab036c11e2a84554b9295b3c83d908f1';

/// See also [getRecipes].
@ProviderFor(getRecipes)
final getRecipesProvider = AutoDisposeFutureProvider<List<dynamic>>.internal(
  getRecipes,
  name: r'getRecipesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getRecipesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetRecipesRef = AutoDisposeFutureProviderRef<List<dynamic>>;
String _$recipeDetailsHash() => r'363cd1c1855c7ccc5457e63fb89cd11d0bdd4fbf';

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

/// See also [recipeDetails].
@ProviderFor(recipeDetails)
const recipeDetailsProvider = RecipeDetailsFamily();

/// See also [recipeDetails].
class RecipeDetailsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [recipeDetails].
  const RecipeDetailsFamily();

  /// See also [recipeDetails].
  RecipeDetailsProvider call(
    dynamic recipeId,
  ) {
    return RecipeDetailsProvider(
      recipeId,
    );
  }

  @override
  RecipeDetailsProvider getProviderOverride(
    covariant RecipeDetailsProvider provider,
  ) {
    return call(
      provider.recipeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeDetailsProvider';
}

/// See also [recipeDetails].
class RecipeDetailsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [recipeDetails].
  RecipeDetailsProvider(
    dynamic recipeId,
  ) : this._internal(
          (ref) => recipeDetails(
            ref as RecipeDetailsRef,
            recipeId,
          ),
          from: recipeDetailsProvider,
          name: r'recipeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeDetailsHash,
          dependencies: RecipeDetailsFamily._dependencies,
          allTransitiveDependencies:
              RecipeDetailsFamily._allTransitiveDependencies,
          recipeId: recipeId,
        );

  RecipeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final dynamic recipeId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(RecipeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailsProvider._internal(
        (ref) => create(ref as RecipeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _RecipeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailsProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailsRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `recipeId` of this provider.
  dynamic get recipeId;
}

class _RecipeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RecipeDetailsRef {
  _RecipeDetailsProviderElement(super.provider);

  @override
  dynamic get recipeId => (origin as RecipeDetailsProvider).recipeId;
}

String _$cartHash() => r'2c38f1aad9a3e43e8b1a548d7fcfc1804abbdf05';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider = AutoDisposeNotifierProvider<Cart, List<int>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = AutoDisposeNotifier<List<int>>;
String _$recipeDetailsHash() => r'6f678dc53cdad8e8f4f653980b3f8b3685f270b0';

abstract class _$RecipeDetails
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final int recipeId;

  FutureOr<Map<String, dynamic>> build(
    int recipeId,
  );
}

/// See also [RecipeDetails].
@ProviderFor(RecipeDetails)
const recipeDetailsProvider = RecipeDetailsFamily();

/// See also [RecipeDetails].
class RecipeDetailsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [RecipeDetails].
  const RecipeDetailsFamily();

  /// See also [RecipeDetails].
  RecipeDetailsProvider call(
    int recipeId,
  ) {
    return RecipeDetailsProvider(
      recipeId,
    );
  }

  @override
  RecipeDetailsProvider getProviderOverride(
    covariant RecipeDetailsProvider provider,
  ) {
    return call(
      provider.recipeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeDetailsProvider';
}

/// See also [RecipeDetails].
class RecipeDetailsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RecipeDetails, Map<String, dynamic>> {
  /// See also [RecipeDetails].
  RecipeDetailsProvider(
    int recipeId,
  ) : this._internal(
          () => RecipeDetails()..recipeId = recipeId,
          from: recipeDetailsProvider,
          name: r'recipeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeDetailsHash,
          dependencies: RecipeDetailsFamily._dependencies,
          allTransitiveDependencies:
              RecipeDetailsFamily._allTransitiveDependencies,
          recipeId: recipeId,
        );

  RecipeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final int recipeId;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant RecipeDetails notifier,
  ) {
    return notifier.build(
      recipeId,
    );
  }

  @override
  Override overrideWith(RecipeDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailsProvider._internal(
        () => create()..recipeId = recipeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecipeDetails, Map<String, dynamic>>
      createElement() {
    return _RecipeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailsProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailsRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `recipeId` of this provider.
  int get recipeId;
}

class _RecipeDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RecipeDetails,
        Map<String, dynamic>> with RecipeDetailsRef {
  _RecipeDetailsProviderElement(super.provider);

  @override
  int get recipeId => (origin as RecipeDetailsProvider).recipeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
