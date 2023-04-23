import 'package:isar/isar.dart';

part 'iptv_server.g.dart';

@collection
class IptvServer {
  Id id;

  String name;

  String url;

  DateTime? lastSync;

  IptvServer(
    this.name,
    this.url, {
    this.id = Isar.autoIncrement,
    this.lastSync,
  });
}
