import 'package:drift/drift.dart';

class NotifiLocalEntity extends Table {
  IntColumn get id => integer().autoIncrement().named("id")();
  IntColumn get isEnable => integer().named("isEnable")();
}
