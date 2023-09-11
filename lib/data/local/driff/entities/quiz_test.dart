import 'package:drift/drift.dart';
import 'package:math/data/local/driff/entities/pre_test.dart';
class QuizTestEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get preId => integer().named("preId").references(PreTestEntity, #id)();
  TextColumn get num1 => text().nullable().named('num1')();
  TextColumn get quiz => text().nullable().named('quiz')();
  BoolColumn get infoQuiz => boolean().nullable().named('infoQuiz')();
  TextColumn get num2 => text().nullable().named("num2")();
  TextColumn get answer => text().named("answer")();
  TextColumn get answerSelect => text().named("answerSelect")();
}
