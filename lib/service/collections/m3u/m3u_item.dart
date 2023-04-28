import 'package:isar/isar.dart';

import '../iptv_server/iptv_server.dart';

part 'm3u_item.g.dart';

@collection
class M3UItem {
  Id id = Isar.autoIncrement;

  String link;

  int? duration;

  String? title;

  @Index(type: IndexType.hash)
  String? series;

  @Index(type: IndexType.hash)
  String? groupTitle;

  String? season;

  String? episode;

  Attributes? attributes;

  @enumerated
  late M3UType name;

  final iptvServer = IsarLink<IptvServer>();

  M3UItem(this.link, this.duration, this.title, this.series, this.groupTitle,
      this.attributes, this.name, this.season, this.episode);
}

@embedded
class Attributes {
  String? timeShift = '';

  String? tvgId;

  String? tvgName;

  String? tvgLogo;

  String? groupTitle;

  Attributes(
      {this.timeShift = '',
      this.tvgId = '',
      this.tvgName = '',
      this.tvgLogo = '',
      this.groupTitle = ''});
}

enum M3UType {
  movie,
  series,
  channel,
}
