import 'package:drift/drift.dart';

class PrePraLocalEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sign => text().named('sign')();
  TextColumn get option => text().named('option_game_mode')();
  TextColumn get dateSave => text().named('dateSave')();
  IntColumn get sumQ => integer().named("sumQ")();
  IntColumn get score => integer().nullable().named("score")();
}
