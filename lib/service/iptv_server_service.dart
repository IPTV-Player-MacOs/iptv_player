import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';

class IptvServerService {
  IptvServerService(this.isarService);

  final IsarService isarService;

  Future<List<IptvServer>> findAll() async {
    var items = await isarService.isar.iptvServers.where().findAll();
    return items;
  }

  Stream<List<IptvServer>> findAllStream() {
    return isarService.isar.iptvServers.where().watch(fireImmediately: true);
  }

  Future<IptvServer?> findById(Id id) async {
    return await isarService.isar.iptvServers.get(id);
  }

  Stream<IptvServer?> findByIdStream(Id id) {
    return isarService.isar.iptvServers.watchObject(id, fireImmediately: true);
  }

  Future<Id> put(IptvServer server) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.iptvServers.put(server);
    });
  }

  Future<bool> delete(Id id) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.iptvServers.delete(id);
    });
  }

  Future<Id> setLastSyncDate(IptvServer server) async {
    server.lastSync = DateTime.now();
    return await put(server);
  }
}
