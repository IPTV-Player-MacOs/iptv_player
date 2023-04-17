import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
IsarService getIsar(GetIsarRef ref) {
  return IsarService();
}

class IsarService {
  Isar? _isar;

  Isar get isar => _isar!;

  void init(Isar isar) async {
    _isar ??= isar;
  }
}
