import 'package:drift/drift.dart';

class PlayerLocalEntity extends Table {
  IntColumn get id => integer().autoIncrement().named("id")();
  TextColumn get name => text().named("name")();
  TextColumn get imageUser => text().named("imageUser")();
  RealColumn get score => real().nullable().named("score")();
  IntColumn get participate => integer().named("participate")();
}
