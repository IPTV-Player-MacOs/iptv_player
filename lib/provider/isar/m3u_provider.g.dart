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
    r'c8d2b7400af53386464cece9dc355a685a2aed30';

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
    = AutoDisposeFutureProviderRef<bool>;

/// See also [clearDownloadAndPersistActivePlaylistItems].
@ProviderFor(clearDownloadAndPersistActivePlaylistItems)
const clearDownloadAndPersistActivePlaylistItemsProvider =
    ClearDownloadAndPersistActivePlaylistItemsFamily();

/// See also [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsFamily
    extends Family<AsyncValue<bool>> {
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
    extends AutoDisposeFutureProvider<bool> {
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

String _$findAllMoviesHash() => r'099b9e5d46b2d364154cd037258177ef6922e03a';
typedef FindAllMoviesRef = AutoDisposeStreamProviderRef<List<M3UItem>>;

/// See also [findAllMovies].
@ProviderFor(findAllMovies)
const findAllMoviesProvider = FindAllMoviesFamily();

/// See also [findAllMovies].
class FindAllMoviesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllMovies].
  const FindAllMoviesFamily();

  /// See also [findAllMovies].
  FindAllMoviesProvider call({
    String? groupTitle,
  }) {
    return FindAllMoviesProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllMoviesProvider getProviderOverride(
    covariant FindAllMoviesProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
  String? get name => r'findAllMoviesProvider';
}

/// See also [findAllMovies].
class FindAllMoviesProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllMovies].
  FindAllMoviesProvider({
    this.groupTitle,
  }) : super.internal(
          (ref) => findAllMovies(
            ref,
            groupTitle: groupTitle,
          ),
          from: findAllMoviesProvider,
          name: r'findAllMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllMoviesHash,
          dependencies: FindAllMoviesFamily._dependencies,
          allTransitiveDependencies:
              FindAllMoviesFamily._allTransitiveDependencies,
        );

  final String? groupTitle;

  @override
  bool operator ==(Object other) {
    return other is FindAllMoviesProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllSeriesHash() => r'5cbbf5506bbd4cffb7a8423df9c0c15c102f84f6';
typedef FindAllSeriesRef = AutoDisposeStreamProviderRef<List<M3UItem>>;

/// See also [findAllSeries].
@ProviderFor(findAllSeries)
const findAllSeriesProvider = FindAllSeriesFamily();

/// See also [findAllSeries].
class FindAllSeriesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllSeries].
  const FindAllSeriesFamily();

  /// See also [findAllSeries].
  FindAllSeriesProvider call({
    String? groupTitle,
  }) {
    return FindAllSeriesProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllSeriesProvider getProviderOverride(
    covariant FindAllSeriesProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
  String? get name => r'findAllSeriesProvider';
}

/// See also [findAllSeries].
class FindAllSeriesProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllSeries].
  FindAllSeriesProvider({
    this.groupTitle,
  }) : super.internal(
          (ref) => findAllSeries(
            ref,
            groupTitle: groupTitle,
          ),
          from: findAllSeriesProvider,
          name: r'findAllSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllSeriesHash,
          dependencies: FindAllSeriesFamily._dependencies,
          allTransitiveDependencies:
              FindAllSeriesFamily._allTransitiveDependencies,
        );

  final String? groupTitle;

  @override
  bool operator ==(Object other) {
    return other is FindAllSeriesProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllSeriesGroupsHash() =>
    r'f1a73b099aeea3cb0d303307b40b216da11632bc';

/// See also [findAllSeriesGroups].
@ProviderFor(findAllSeriesGroups)
final findAllSeriesGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllSeriesGroups,
  name: r'findAllSeriesGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllSeriesGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllSeriesGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
String _$findAllItemsOfSeriesAndSeasonHash() =>
    r'e6592450023f174c9cb58919b999de284e7d025b';
typedef FindAllItemsOfSeriesAndSeasonRef
    = AutoDisposeStreamProviderRef<List<M3UItem>>;

/// See also [findAllItemsOfSeriesAndSeason].
@ProviderFor(findAllItemsOfSeriesAndSeason)
const findAllItemsOfSeriesAndSeasonProvider =
    FindAllItemsOfSeriesAndSeasonFamily();

/// See also [findAllItemsOfSeriesAndSeason].
class FindAllItemsOfSeriesAndSeasonFamily
    extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllItemsOfSeriesAndSeason].
  const FindAllItemsOfSeriesAndSeasonFamily();

  /// See also [findAllItemsOfSeriesAndSeason].
  FindAllItemsOfSeriesAndSeasonProvider call({
    required String series,
    required String season,
  }) {
    return FindAllItemsOfSeriesAndSeasonProvider(
      series: series,
      season: season,
    );
  }

  @override
  FindAllItemsOfSeriesAndSeasonProvider getProviderOverride(
    covariant FindAllItemsOfSeriesAndSeasonProvider provider,
  ) {
    return call(
      series: provider.series,
      season: provider.season,
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
  String? get name => r'findAllItemsOfSeriesAndSeasonProvider';
}

/// See also [findAllItemsOfSeriesAndSeason].
class FindAllItemsOfSeriesAndSeasonProvider
    extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllItemsOfSeriesAndSeason].
  FindAllItemsOfSeriesAndSeasonProvider({
    required this.series,
    required this.season,
  }) : super.internal(
          (ref) => findAllItemsOfSeriesAndSeason(
            ref,
            series: series,
            season: season,
          ),
          from: findAllItemsOfSeriesAndSeasonProvider,
          name: r'findAllItemsOfSeriesAndSeasonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllItemsOfSeriesAndSeasonHash,
          dependencies: FindAllItemsOfSeriesAndSeasonFamily._dependencies,
          allTransitiveDependencies:
              FindAllItemsOfSeriesAndSeasonFamily._allTransitiveDependencies,
        );

  final String series;
  final String season;

  @override
  bool operator ==(Object other) {
    return other is FindAllItemsOfSeriesAndSeasonProvider &&
        other.series == series &&
        other.season == season;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, series.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllSeasonsOfSeriesHash() =>
    r'f0fe50bc33848f84f818ec6bd3439103297ff481';
typedef FindAllSeasonsOfSeriesRef = AutoDisposeStreamProviderRef<List<M3UItem>>;

/// See also [findAllSeasonsOfSeries].
@ProviderFor(findAllSeasonsOfSeries)
const findAllSeasonsOfSeriesProvider = FindAllSeasonsOfSeriesFamily();

/// See also [findAllSeasonsOfSeries].
class FindAllSeasonsOfSeriesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllSeasonsOfSeries].
  const FindAllSeasonsOfSeriesFamily();

  /// See also [findAllSeasonsOfSeries].
  FindAllSeasonsOfSeriesProvider call({
    required String series,
  }) {
    return FindAllSeasonsOfSeriesProvider(
      series: series,
    );
  }

  @override
  FindAllSeasonsOfSeriesProvider getProviderOverride(
    covariant FindAllSeasonsOfSeriesProvider provider,
  ) {
    return call(
      series: provider.series,
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
  String? get name => r'findAllSeasonsOfSeriesProvider';
}

/// See also [findAllSeasonsOfSeries].
class FindAllSeasonsOfSeriesProvider
    extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllSeasonsOfSeries].
  FindAllSeasonsOfSeriesProvider({
    required this.series,
  }) : super.internal(
          (ref) => findAllSeasonsOfSeries(
            ref,
            series: series,
          ),
          from: findAllSeasonsOfSeriesProvider,
          name: r'findAllSeasonsOfSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllSeasonsOfSeriesHash,
          dependencies: FindAllSeasonsOfSeriesFamily._dependencies,
          allTransitiveDependencies:
              FindAllSeasonsOfSeriesFamily._allTransitiveDependencies,
        );

  final String series;

  @override
  bool operator ==(Object other) {
    return other is FindAllSeasonsOfSeriesProvider && other.series == series;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, series.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllChannelsHash() => r'bf243895a58df86515a51d6a5c73829028507404';
typedef FindAllChannelsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;

/// See also [findAllChannels].
@ProviderFor(findAllChannels)
const findAllChannelsProvider = FindAllChannelsFamily();

/// See also [findAllChannels].
class FindAllChannelsFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllChannels].
  const FindAllChannelsFamily();

  /// See also [findAllChannels].
  FindAllChannelsProvider call({
    String? groupTitle,
  }) {
    return FindAllChannelsProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllChannelsProvider getProviderOverride(
    covariant FindAllChannelsProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
  String? get name => r'findAllChannelsProvider';
}

/// See also [findAllChannels].
class FindAllChannelsProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllChannels].
  FindAllChannelsProvider({
    this.groupTitle,
  }) : super.internal(
          (ref) => findAllChannels(
            ref,
            groupTitle: groupTitle,
          ),
          from: findAllChannelsProvider,
          name: r'findAllChannelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllChannelsHash,
          dependencies: FindAllChannelsFamily._dependencies,
          allTransitiveDependencies:
              FindAllChannelsFamily._allTransitiveDependencies,
        );

  final String? groupTitle;

  @override
  bool operator ==(Object other) {
    return other is FindAllChannelsProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$findAllChannelGroupsHash() =>
    r'b4008ae7526be2cf26c3d69c42741515d985cdae';

/// See also [findAllChannelGroups].
@ProviderFor(findAllChannelGroups)
final findAllChannelGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllChannelGroups,
  name: r'findAllChannelGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllChannelGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllChannelGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
String _$findAllMovieGroupsHash() =>
    r'58e7d7e4e3119580014e27d46aa78510d7ff6f6c';

/// See also [findAllMovieGroups].
@ProviderFor(findAllMovieGroups)
final findAllMovieGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllMovieGroups,
  name: r'findAllMovieGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllMovieGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllMovieGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
