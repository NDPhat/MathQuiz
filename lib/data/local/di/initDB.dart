import 'package:math/data/local/repo/pre_quiz/pre_quiz_impl.dart';
import 'package:math/data/local/repo/pre_test/per_test_repo_impl.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo_impl.dart';
import 'package:math/data/local/repo/test/test_repo.dart';
import 'package:math/data/local/repo/test/test_repo_impl.dart';

import '../../../main.dart';
import '../driff/db/db_app.dart';
import '../repo/pre_quiz/pre_quiz_repo.dart';

void initDBandLocalRepo() {
  instance.registerLazySingleton<AppDb>(() => AppDb());
  instance.registerLazySingleton<PreQuizLocalRepo>(
      () => PreQuizLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<PreTestLocalRepo>(
      () => PreTestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<TestLocalRepo>(
      () => TestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<QuizPraLocalRepo>(
      () => QuizPraLocalRepoImpl(instance.get<AppDb>()));
}
