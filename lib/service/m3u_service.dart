import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';

import 'collections/m3u/m3u_item.dart';

class M3uService {
  M3uService(this.isarService);

  final IsarService isarService;
  IptvServer? _activeIptvServer;

  set activeIptvServer(IptvServer value) {
    _activeIptvServer = value;
  }

  IptvServer? getActiveIptvServer() {
    return _activeIptvServer;
  }

  Future<List<M3UItem>> findAll(Isar isar, IptvServer iptvServer) async {
    return await isar.m3UItems.filter().iptvServer((q) {
      return q.idEqualTo(iptvServer.id);
    }).findAll();
  }

  Stream<List<M3UItem>> findAllMovies(
      IptvServer activeIptvServer, String? searchValue, String? groupTitle) {
    QueryBuilder<M3UItem, M3UItem, QFilterCondition> query =
        isarService.isar.m3UItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (groupTitle != null && groupTitle.isNotEmpty) {
      query = query.groupTitleEqualTo(groupTitle);
    }
    return query
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.movie)
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllMovieGroups(IptvServer activeIptvServer) {
    return isarService.isar.m3UItems
        .where(distinct: true)
        .filter()
        .nameEqualTo(M3UType.movie)
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .sortByGroupTitle()
        .distinctByGroupTitle()
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllItemsOfSeriesAndSeason(
      IptvServer activeIptvServer, String series, String season) {
    return isarService.isar.m3UItems
        .filter()
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.series)
        .seriesEqualTo(series)
        .seasonEqualTo(season)
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllSeasonsOfSeries(
      IptvServer activeIptvServer, String series) {
    return isarService.isar.m3UItems
        .where(distinct: true)
        .filter()
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.series)
        .seriesEqualTo(series)
        .distinctBySeason()
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllSeries(
      IptvServer activeIptvServer, String? searchValue, String? groupTitle) {
    var query = isarService.isar.m3UItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).nameEqualTo(M3UType.series);
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.seriesContains(searchValue, caseSensitive: false);
    }
    if (groupTitle != null && groupTitle.isNotEmpty) {
      query = query.groupTitleEqualTo(groupTitle);
    }
    return query.sortBySeries().distinctBySeries().watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllSeriesGroups(IptvServer activeIptvServer) {
    return isarService.isar.m3UItems
        .where(distinct: true)
        .filter()
        .nameEqualTo(M3UType.series)
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .sortByGroupTitle()
        .distinctByGroupTitle()
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllChannelGroups(IptvServer activeIptvServer) {
    return isarService.isar.m3UItems
        .where(distinct: true)
        .filter()
        .nameEqualTo(M3UType.channel)
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .sortByGroupTitle()
        .distinctByGroupTitle()
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllChannels(
      String? searchValue, String? groupTitle) {
    QueryBuilder<M3UItem, M3UItem, QFilterCondition> query =
        isarService.isar.m3UItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (groupTitle != null && groupTitle.isNotEmpty) {
      query = query.groupTitleEqualTo(groupTitle);
    }
    return query
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.channel)
        .watch(fireImmediately: true);
  }

  Future<List<M3UItem>> findByCategory(
      String category, IptvServer activeIptvServer) async {
    return await isarService.isar.m3UItems
        .where()
        .groupTitleEqualTo(category)
        .filter()
        .iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findAll();
  }

  Future<M3UItem?> findById(Id id) async {
    return await isarService.isar.m3UItems.get(id);
  }

  Future<Id> put(M3UItem server) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.put(server);
    });
  }

  Future<void> deleteAll() async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.clear();
    });
  }

  Future<bool> delete(Id id) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.delete(id);
    });
  }

  Future<int> clear() async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.filter().iptvServer((q) {
        return q.idEqualTo(_activeIptvServer!.id);
      }).deleteAll();
    });
  }
}
