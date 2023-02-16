import 'package:drift/drift.dart';

class PreQuizEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sign => text().named('sign')();
  TextColumn get dateSave => text().named('dateSave')();
  IntColumn get numQ => integer().named("numQ")();
  IntColumn get eNum => integer().named("eNum")();
  IntColumn get sNum => integer().named("sNum")();
  IntColumn get timePer => integer().named("timePer")();
  IntColumn get score => integer().named("score")();
}
