import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'theme.g.dart';

@collection
class ThemeCollection {
  Id id;

  @enumerated
  ThemeMode mode;

  ThemeCollection(this.id, this.mode);
}
