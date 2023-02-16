
import 'package:drift/drift.dart';

class PreTestEntity extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dateSave => text().named('dateSave')();
  IntColumn get sumTime => integer().named("sumTime")();
  IntColumn get score => integer().nullable().named("score")();


}