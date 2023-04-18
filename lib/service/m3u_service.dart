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
    //var freeTv = await isar.m3UItems.where().groupTitleEqualTo("Free-TV").findAll();
    return await isar.m3UItems.filter().iptvServer((q) {
      return q.idEqualTo(iptvServer.id);
    }).findAll();
    //return await isar.m3UItems.where().groupTitleEqualTo("Free-TV").findAll();
    //return await isar.m3UItems.filter().titleEqualTo("DE: ZDF HD").findAll();
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
}