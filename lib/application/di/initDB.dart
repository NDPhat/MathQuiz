import 'package:math/data/local/repo/detail_notifi/detail_notifi_repo_impl.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo.dart';
import 'package:math/data/local/repo/player_local/player_local_repo.dart';
import 'package:math/data/local/repo/player_local/player_local_repo_impl.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_impl.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo_impl.dart';
import 'package:math/data/model/app_global.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/authen/authen.dart';
import '../../../main.dart';
import '../../data/local/driff/db/db_app.dart';
import '../../data/local/repo/detail_notifi/detail_notifi_repo.dart';
import '../../data/local/repo/notifi_local/notifi_local_repo_impl.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../data/local/repo/pre_test/pre_test_repo_impl.dart';
import '../../data/local/repo/quiz_pra/quiz_game_repo.dart';
import '../../data/local/repo/quiz_pra/quiz_game_repo_impl.dart';
import '../../data/model/user_local.dart';
import '../../data/remote/api/Repo_impl/api_user_repo_impl.dart';

void initDBandLocalRepo() {
  instance.registerLazySingleton<AppDb>(() => AppDb());
  instance.registerLazySingleton<PreQuizGameRepo>(
      () => PreQuizLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<NotifiLocalRepo>(
      () => NotifiLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<PlayerLocalRepo>(
      () => PlayerLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<DetailNotifiLocalRepo>(
      () => DetailNotifiLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<PreTestLocalRepo>(
      () => PreTestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<QuizTestLocalRepo>(
      () => QuizTestLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<QuizGameLocalRepo>(
      () => QuizGameLocalRepoImpl(instance.get<AppDb>()));
  instance.registerLazySingleton<UserAPIRepo>(() => UserAPIRepoImpl());
  instance.registerLazySingleton<AuthenRepository>(() => AuthenRepository());
  instance.registerLazySingleton<UserGlobal>(() => UserGlobal());
  instance.registerLazySingleton<UserLocal>(() => UserLocal());
  instance.registerLazySingleton<AppGlobal>(() => AppGlobal());
}
