import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:math/data/local/driff/entities/PreQuiz.dart';
import 'package:math/data/local/driff/entities/PreTest.dart';
import 'package:math/data/local/driff/entities/Test.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../entities/Quiz.dart';

part 'db_app.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
    tables: [PreQuizEntity, PreTestEntity, QuizTestEntity, QuizPraEntity])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
