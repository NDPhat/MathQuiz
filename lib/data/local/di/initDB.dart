import 'package:math/data/local/repo/pre_quiz/pre_quiz_impl.dart';

import '../../../main.dart';
import '../driff/db/db_app.dart';
import '../repo/pre_quiz/pre_quiz_repo.dart';

void initDBandLocalRepo() {
  instance.registerLazySingleton<AppDb>(() => AppDb());
  instance.registerLazySingleton<PreQuizLocalRepo>(
      () => PreQuizLocalRepoImpl(instance.get<AppDb>()));
}
