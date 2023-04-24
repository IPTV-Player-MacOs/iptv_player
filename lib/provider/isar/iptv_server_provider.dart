import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/iptv_server_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'isar_provider.dart';

part 'iptv_server_provider.g.dart';

@Riverpod(keepAlive: true)
IptvServerService iptvServerService(IptvServerServiceRef ref) {
  final isar = ref.watch(getIsarProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final m3uParseService = ref.watch(m3uParseServiceProvider);
  return IptvServerService(isar, m3uService, m3uParseService);
}

@riverpod
Stream<List<IptvServer>> iptvServerItems(IptvServerItemsRef ref) {
  return ref.watch(iptvServerServiceProvider).findAllStream();
}

@riverpod
Stream<IptvServer?> activeIptvServer(ActiveIptvServerRef ref) {
  final activeServer = ref.watch(m3uServiceProvider).getActiveIptvServer();
  return ref.watch(iptvServerServiceProvider).findByIdStream(activeServer!.id);
}

@riverpod
class IsUpdatingActiveIptvServer extends _$IsUpdatingActiveIptvServer {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
