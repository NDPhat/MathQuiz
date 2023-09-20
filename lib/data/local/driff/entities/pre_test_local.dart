
import 'package:drift/drift.dart';

class PreTestLocalEntity extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dateSave => text().named('dateSave')();
  IntColumn get sumQ => integer().nullable().named("sumQ")();
  IntColumn get score => integer().nullable().named("score")();


}