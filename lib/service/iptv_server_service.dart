import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/m3u_parse_service.dart';
import 'package:iptv_player/service/m3u_service.dart';
import 'package:isar/isar.dart';

class IptvServerService {
  IptvServerService(this.isarService, this.m3uService, this.m3uParseService);

  final IsarService isarService;
  final M3uService m3uService;
  final M3uParseService m3uParseService;

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

  Future<void> refreshServerItems({bool? forced}) async {
    final activeIptvServer = m3uService.getActiveIptvServer()!;
    final date24HoursAgo = DateTime.now().subtract(
      const Duration(days: 1),
    );
    if (forced == true ||
        activeIptvServer.lastSync == null ||
        activeIptvServer.lastSync!.isBefore(date24HoursAgo)) {
      await m3uService.clear();
      await m3uParseService
          .downloadAndPersist(activeIptvServer);
      await setLastSyncDate(activeIptvServer);
    }
  }
}
