import 'package:isar/isar.dart';

part 'iptv_server.g.dart';

@collection
class IptvServer {
  Id id;

  String name;

  String url;

  IptvServer(this.name, this.url, {this.id = Isar.autoIncrement});
}
