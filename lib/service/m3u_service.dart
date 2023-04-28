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

  Stream<List<M3UItem>> findAllMovies(String? searchValue) {
    QueryBuilder<M3UItem, M3UItem, QFilterCondition> query =
        isarService.isar.m3UItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    return query
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.movie)
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllSeries(String? searchValue) {
    QueryBuilder<M3UItem, M3UItem, QFilterCondition> query =
        isarService.isar.m3UItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    return query
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.series)
        .watch(fireImmediately: true);
  }

  Stream<List<M3UItem>> findAllChannels(String? searchValue) {
    QueryBuilder<M3UItem, M3UItem, QFilterCondition> query =
        isarService.isar.m3UItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    return query
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.channel)
        .watch(fireImmediately: true);
  }

  Future<List<M3UItem>> findByCategory(String category) async {
    return await isarService.isar.m3UItems
        .where()
        .groupTitleEqualTo(category)
        .findAll();
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
