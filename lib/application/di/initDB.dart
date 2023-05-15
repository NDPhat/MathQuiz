import 'package:math/data/local/repo/pre_quiz/pre_quiz_impl.dart';
import 'package:math/data/local/repo/pre_test/per_test_repo_impl.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo_impl.dart';
import 'package:math/data/local/repo/test/test_repo.dart';
import 'package:math/data/local/repo/test/test_repo_impl.dart';
import 'package:math/data/remote/api/Repo/api_teacher_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/api/Repo_impl/api_teacher_repo_impl.dart';

import '../../../main.dart';
import '../../data/local/driff/db/db_app.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../data/remote/api/Repo_impl/api_user_repo_impl.dart';

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
  instance
      .registerLazySingleton<UserLocalAPIRepo>(() => UserLocalAPIRepoImpl());
  instance.registerLazySingleton<TeacherLocalAPIRepo>(
      () => TeacherLocalAPIRepoImpl());
}
