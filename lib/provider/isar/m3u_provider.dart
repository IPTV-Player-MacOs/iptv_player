import 'package:iptv_player/home/views/search_value_provider.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:iptv_player/service/m3u_parse_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/m3u_service.dart';
import 'isar_provider.dart';

part 'm3u_provider.g.dart';

@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

@Riverpod(keepAlive: true)
M3uParseService m3uParseService(M3uParseServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uParseService(isar);
}

@riverpod
Future<bool> clearDownloadAndPersistActivePlaylistItems(
  ClearDownloadAndPersistActivePlaylistItemsRef ref, {
  bool? forced,
}) async {
  final m3uService = ref.watch(m3uServiceProvider);
  final iptvService = ref.watch(iptvServerServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  final date24HoursAgo = DateTime.now().subtract(
    const Duration(days: 1),
  );

  if (forced == true ||
      activeIptvServer.lastSync == null ||
      activeIptvServer.lastSync!.isBefore(date24HoursAgo)) {
    await m3uService.clear();
    await ref
        .watch(m3uParseServiceProvider)
        .downloadAndPersist(activeIptvServer);
    await iptvService.setLastSyncDate(activeIptvServer);
  }
  return true;
}

@riverpod
Stream<List<M3UItem>> findAllMovies(FindAllMoviesRef ref) {
  final searchValue = ref.watch(movieSearchValueProvider);

  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllMovies(searchValue);
}

@riverpod
Stream<List<M3UItem>> findAllSeries(FindAllSeriesRef ref) {
  final searchValue = ref.watch(seriesSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllSeries(searchValue);
}

@riverpod
Stream<List<M3UItem>> findAllChannels(FindAllChannelsRef ref) {
  final searchValue = ref.watch(channelSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllChannels(searchValue);
}
