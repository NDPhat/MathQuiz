import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../../../main.dart';
import '../../../remote/authen/authen.dart';
import '../entities/notify_task.dart';
import '../entities/player.dart';
import '../entities/pre_quiz_game.dart';
import '../entities/pre_test.dart';
import '../entities/quiz_game.dart';
import '../entities/quiz_test.dart';

part 'db_app.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  PreQuizGameEntity,
  PreTestEntity,
  QuizGameEntity,
  QuizTestEntity,
  NotifyTask,
  PlayerLocalEntity
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
