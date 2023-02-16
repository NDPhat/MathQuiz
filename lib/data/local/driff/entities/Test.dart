import 'package:drift/drift.dart';

class QuizTestEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get preId => integer().named("preId")();
  IntColumn get num1 => integer().named('num1')();
  TextColumn get sign => text().named('sign')();
  IntColumn get num2 => integer().named("num2")();
  IntColumn get answer => integer().named("answer")();
  IntColumn get answerSelect => integer().named("answerSelect")();
}
