import 'package:drift/drift.dart';
import 'package:math/data/local/driff/entities/pre_pra_local.dart';

class QuizPraLocalEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get prePraId => integer().named("prePraId").references(PrePraLocalEntity, #id)();
  TextColumn get num1 => text().nullable().named('num1')();
  TextColumn get quiz => text().nullable().named('quiz')();
  BoolColumn get infoQuiz => boolean().nullable().named('infoQuiz')();
  TextColumn get sign => text().named('sign')();
  TextColumn get num2 => text().nullable().named("num2")();
  TextColumn get answer => text().named("answer")();
  TextColumn get answerSelect => text().named("answerSelect")();
}
