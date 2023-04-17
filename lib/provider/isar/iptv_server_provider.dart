import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/iptv_server_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'isar_provider.dart';

part 'iptv_server_provider.g.dart';

@Riverpod(keepAlive: true)
IptvServerService iptvServerService(IptvServerServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return IptvServerService(isar);
}

@riverpod
Stream<List<IptvServer>> iptvServerItems(IptvServerItemsRef ref) {
  return ref.watch(iptvServerServiceProvider).findAllStream();
}
