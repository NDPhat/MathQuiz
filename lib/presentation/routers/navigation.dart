import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';

import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/domain/bloc/history/history_test_cubit.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/domain/bloc/test/test_cubit.dart';
import 'package:math/presentation/screen/detail_quiz_game_screen/detail_quiz_game.dart';
import 'package:math/presentation/screen/login/login_screen.dart';
import 'package:math/presentation/screen/option_use_app/option_use_app.dart';

import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../domain/bloc/history/history_pra_cubit.dart';
import '../../main.dart';
import '../screen/check_answer/check_anwser_screen.dart';
import '../screen/detail_test/detail_test_screen.dart';
import '../screen/dual/dual_main_screen.dart';
import '../screen/dual/dual_with_bot_screen.dart';
import '../screen/dual/dual_with_player_screen.dart';

import '../screen/dual/option_bot_dual.dart';
import '../screen/game_screen/find_missing.dart';
import '../screen/game_screen/game_screen.dart';
import '../screen/game_screen/true_false_screen.dart';
import '../screen/history/history_pratice_screen.dart';
import '../screen/history/history_test_screen.dart';
import '../screen/home/home_guest.dart';
import '../screen/home/home_user.dart';
import '../screen/home_work/home_work_game_screen.dart';
import '../screen/home_work/home_work_screen.dart';
import '../screen/option_game_mode/option_game_mode_screen.dart';
import '../screen/option_game_mode/option_sign_screen.dart';
import '../screen/pre_quiz/pre_quiz_game.dart';
import '../screen/test_screen/test_exam_screen.dart';
import '../screen/test_screen/test_practice_screen.dart';
import '../screen/welcome_screen.dart';

class Routers {
  static const String chooseSign = '/choose_sign';
  static const String chooseOption = '/choose_option';
  static const String chooseOptionUseApp = '/choose_option_use_app';
  static const String welcome = '/';
  static const String login = '/login';
  static const String doTestPra = '/doTestPra';
  static const String doTestExam = '/doTestExam';
  static const String game = '/game';
  static const String trueFalse = '/truefalse';
  static const String battle = '/battle';
  static const String battleHuman = '/battleHuman';
  static const String battleBOT = '/battleBOT';
  static const String optionBot = '/optionBot';
  static const String findMissing = '/findMissing';
  static const String homeGuest = '/homeGuest';
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String historyHome = '/historyHome';
  static const String premake = '/premake';
  static const String detailTest = '/detailTest';
  static const String checkAnswer = '/checkAnswer';
  static const String detailQuizGame = '/detailQuizGame';
  static const String homework = '/homework';
  static const String homeworkGame = '/homeworkGame';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return WelcomeScreen();
      case login:
        return LoginUseApp();
      case homework:
        return HomeWorkScreen();
      case chooseOptionUseApp:
        return OptionUseApp();
      case homeworkGame:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizGameLocalRepo>()),
            child: HomeWorkGameScreen());
      case homeGuest:
        return HomeGuestScreen();
      case doTestExam:
        return TestExamScreen();
      case battleBOT:
        return const BotDual();
      case optionBot:
        return OptionModeBotDual();
      case chooseOption:
        return OptionGameModeScreen();
      case chooseSign:
        return OptionSignScreen();
      case premake:
        return BlocProvider(
            create: (context) =>
                PreQuizCubit(preQuizLocalRepo: instance.get<PreQuizGameRepo>()),
            child: PreMakeQuizGame());
      case game:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizGameLocalRepo>()),
            child: GameScreen());
      case trueFalse:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizGameLocalRepo>()),
            child: const TrueFalseScreen());
      case battle:
        return const DualMainScreen();
      case battleHuman:
        return const PlayerDual();
      case findMissing:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizGameLocalRepo>()),
            child: const FindMissing());
      case doTestPra:
        return BlocProvider(
            create: (context) =>
                TestCubit(testLocalRepo: instance.get<QuizTestLocalRepo>()),
            child: const TestScreen());
      case detailTest:
        return const DetailTestScreen();
      case checkAnswer:
        return const CheckAnswerScreen();
      case detailQuizGame:
        return const DetailQuizGame();
      case historyPra:
        return BlocProvider(
            create: (context) => HistoryPraCubit(
                preQuizLocalRepo: instance.get<PreQuizGameRepo>()),
            child: const HistoryPractice());
      case historyTest:
        return BlocProvider(
            create: (context) => HistoryTestCubit(
                preTestLocalRepo: instance.get<PreTestLocalRepo>()),
            child: const HistoryTest());
      default:
        return HomeUserScreen();
    }
  }
}
