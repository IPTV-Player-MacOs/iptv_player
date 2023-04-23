// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$m3uServiceHash() => r'f8e3f5625df4e0bac5ea4b71b04e93c50db1cc9a';

/// See also [m3uService].
@ProviderFor(m3uService)
final m3uServiceProvider = Provider<M3uService>.internal(
  m3uService,
  name: r'm3uServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$m3uServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef M3uServiceRef = ProviderRef<M3uService>;
String _$m3uParseServiceHash() => r'17b0748dc4ee40d0acc35c84597af65fe3f2d959';

/// See also [m3uParseService].
@ProviderFor(m3uParseService)
final m3uParseServiceProvider = Provider<M3uParseService>.internal(
  m3uParseService,
  name: r'm3uParseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$m3uParseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef M3uParseServiceRef = ProviderRef<M3uParseService>;
String _$clearDownloadAndPersistActivePlaylistItemsHash() =>
    r'635fee29c771c8650f4bc7f2005b5474783bae1a';

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

typedef ClearDownloadAndPersistActivePlaylistItemsRef
    = AutoDisposeFutureProviderRef<void>;

/// See also [clearDownloadAndPersistActivePlaylistItems].
@ProviderFor(clearDownloadAndPersistActivePlaylistItems)
const clearDownloadAndPersistActivePlaylistItemsProvider =
    ClearDownloadAndPersistActivePlaylistItemsFamily();

/// See also [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsFamily
    extends Family<AsyncValue<void>> {
  /// See also [clearDownloadAndPersistActivePlaylistItems].
  const ClearDownloadAndPersistActivePlaylistItemsFamily();

  /// See also [clearDownloadAndPersistActivePlaylistItems].
  ClearDownloadAndPersistActivePlaylistItemsProvider call({
    bool? forced,
  }) {
    return ClearDownloadAndPersistActivePlaylistItemsProvider(
      forced: forced,
    );
  }

  @override
  ClearDownloadAndPersistActivePlaylistItemsProvider getProviderOverride(
    covariant ClearDownloadAndPersistActivePlaylistItemsProvider provider,
  ) {
    return call(
      forced: provider.forced,
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
  String? get name => r'clearDownloadAndPersistActivePlaylistItemsProvider';
}

/// See also [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [clearDownloadAndPersistActivePlaylistItems].
  ClearDownloadAndPersistActivePlaylistItemsProvider({
    this.forced,
  }) : super.internal(
          (ref) => clearDownloadAndPersistActivePlaylistItems(
            ref,
            forced: forced,
          ),
          from: clearDownloadAndPersistActivePlaylistItemsProvider,
          name: r'clearDownloadAndPersistActivePlaylistItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clearDownloadAndPersistActivePlaylistItemsHash,
          dependencies:
              ClearDownloadAndPersistActivePlaylistItemsFamily._dependencies,
          allTransitiveDependencies:
              ClearDownloadAndPersistActivePlaylistItemsFamily
                  ._allTransitiveDependencies,
        );

  final bool? forced;

  @override
  bool operator ==(Object other) {
    return other is ClearDownloadAndPersistActivePlaylistItemsProvider &&
        other.forced == forced;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, forced.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllMoviesHash() => r'e17ac5f9c7401e7dbd941345f0011f3cbeaa965c';

/// See also [findAllMovies].
@ProviderFor(findAllMovies)
final findAllMoviesProvider = AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllMovies,
  name: r'findAllMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllMoviesRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
