import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:math/data/local/driff/entities/lcoal_notify.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../entities/player_local.dart';
import '../entities/pre_pra_local.dart';
import '../entities/pre_test_local.dart';
import '../entities/quiz_pra_local.dart';
import '../entities/quiz_test_local.dart';

part 'db_app.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  PrePraLocalEntity,
  PreTestLocalEntity,
  QuizPraLocalEntity,
  QuizTestLocalEntity,
  LocalNotifyEntity,
  PlayerLocalEntity
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
