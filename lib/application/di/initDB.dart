import 'package:math/data/local/repo/pre_quiz/pre_quiz_impl.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo_impl.dart';
import 'package:math/data/model/user_global.dart';

import 'package:math/data/remote/api/Repo/api_teacher_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/api/Repo_impl/api_teacher_repo_impl.dart';

import '../../../main.dart';
import '../../data/local/driff/db/db_app.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../data/local/repo/pre_test/pre_test_repo_impl.dart';
import '../../data/local/repo/quiz_pra/quiz_game_repo.dart';
import '../../data/local/repo/quiz_pra/quiz_game_repo_impl.dart';
import '../../data/remote/api/Repo_impl/api_user_repo_impl.dart';

void initDBandLocalRepo() {
  instance.registerLazySingleton<AppDb>(() => AppDb());
  instance.registerLazySingleton<PreQuizGameRepo>(
      () => PreQuizLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<PreTestLocalRepo>(
      () => PreTestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<QuizTestLocalRepo>(
      () => QuizTestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<QuizGameLocalRepo>(
      () => QuizGameLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<UserAPIRepo>(() => UserAPIRepoImpl());
  instance.registerLazySingleton<TeacherLocalAPIRepo>(
      () => TeacherLocalAPIRepoImpl());
  instance.registerLazySingleton<UserGlobal>(() => UserGlobal());
}
