import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:iptv_player/service/collections/theme/theme.dart';
import 'package:isar/isar.dart';

const List<CollectionSchema> allSchemas = [
  IptvServerSchema,
  M3UItemSchema,
  ThemeCollectionSchema,
];
