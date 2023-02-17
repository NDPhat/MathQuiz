import 'package:drift/drift.dart';

class QuizPraEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get preId => integer().named("preId")();
  IntColumn get num1 => integer().nullable().named('num1')();
  TextColumn get sign => text().named('sign')();
  IntColumn get num2 => integer().nullable().named("num2")();
  IntColumn get answer => integer().named("answer")();
  IntColumn get answerSelect => integer().named("answerSelect")();
}
