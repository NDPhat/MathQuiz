import 'package:drift/drift.dart';

class PreQuizGameEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sign => text().named('sign')();
  TextColumn get option => text().named('option_game_mode')();
  TextColumn get dateSave => text().named('dateSave')();
  IntColumn get numQ => integer().named("numQ")();
  IntColumn get score => integer().nullable().named("score")();
}
