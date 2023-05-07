import 'package:iptv_player/home/provider/search_value_provider.dart';
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
Stream<List<M3UItem>> findAllMovies(FindAllMoviesRef ref,
    {String? groupTitle}) {
  final searchValue = ref.watch(movieSearchValueProvider);
  final activeIptvServer = ref.watch(m3uServiceProvider).getActiveIptvServer()!;

  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllMovies(activeIptvServer, searchValue, groupTitle);
}

@riverpod
Stream<List<M3UItem>> findAllSeries(FindAllSeriesRef ref,
    {String? groupTitle}) {
  final searchValue = ref.watch(seriesSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeries(activeIptvServer, searchValue, groupTitle);
}

@riverpod
Stream<List<M3UItem>> findAllSeriesGroups(FindAllSeriesGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllSeriesGroups(activeIptvServer);
}

@riverpod
Stream<List<M3UItem>> findAllItemsOfSeriesAndSeason(
  FindAllItemsOfSeriesAndSeasonRef ref, {
  required String series,
  required String season,
}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllItemsOfSeriesAndSeason(
      activeIptvServer, series, season);
}

@riverpod
Stream<List<M3UItem>> findAllSeasonsOfSeries(FindAllSeasonsOfSeriesRef ref,
    {required String series}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeasonsOfSeries(activeIptvServer, series);
}

@riverpod
Stream<List<M3UItem>> findAllChannels(FindAllChannelsRef ref,
    {String? groupTitle}) {
  final searchValue = ref.watch(channelSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllChannels(searchValue, groupTitle);
}

@riverpod
Stream<List<M3UItem>> findAllChannelGroups(FindAllChannelGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllChannelGroups(activeIptvServer);
}

@riverpod
Stream<List<M3UItem>> findAllMovieGroups(FindAllMovieGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllMovieGroups(activeIptvServer);
}
