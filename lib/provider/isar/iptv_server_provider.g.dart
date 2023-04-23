// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iptv_server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$iptvServerServiceHash() => r'2ca957c4128c58cc914c53e0cc3f1c5500cb355b';

/// See also [iptvServerService].
@ProviderFor(iptvServerService)
final iptvServerServiceProvider = Provider<IptvServerService>.internal(
  iptvServerService,
  name: r'iptvServerServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$iptvServerServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IptvServerServiceRef = ProviderRef<IptvServerService>;
String _$iptvServerItemsHash() => r'69dbeda6640f15f270176f8b3769c77c23a902a9';

/// See also [iptvServerItems].
@ProviderFor(iptvServerItems)
final iptvServerItemsProvider =
    AutoDisposeStreamProvider<List<IptvServer>>.internal(
  iptvServerItems,
  name: r'iptvServerItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$iptvServerItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IptvServerItemsRef = AutoDisposeStreamProviderRef<List<IptvServer>>;
String _$activeIptvServerHash() => r'00eb04d49b21532e71faae8cd5b0fadddc8d3544';

/// See also [activeIptvServer].
@ProviderFor(activeIptvServer)
final activeIptvServerProvider =
    AutoDisposeStreamProvider<IptvServer?>.internal(
  activeIptvServer,
  name: r'activeIptvServerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeIptvServerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveIptvServerRef = AutoDisposeStreamProviderRef<IptvServer?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
