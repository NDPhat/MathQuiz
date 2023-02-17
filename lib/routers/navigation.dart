import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo.dart';
import 'package:math/data/local/repo/test/test_repo.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/domain/bloc/history/history_test_cubit.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/domain/bloc/test/test_cubit.dart';
import 'package:math/screen/check_answer/check_anwser_screen.dart';
import 'package:math/screen/detail_test/detail_test_screen.dart';
import 'package:math/screen/game_screen/game_screen.dart';
import 'package:math/screen/game_screen/true_false_screen.dart';
import 'package:math/screen/history/history_home.dart';
import 'package:math/screen/history/history_pratice_screen.dart';
import 'package:math/screen/history/history_test_screen.dart';
import 'package:math/screen/home/home_screen.dart';
import 'package:math/screen/option/option_screen.dart';
import 'package:math/screen/pre_quiz/pre_quiz.dart';
import 'package:math/screen/welcome_screen.dart';

import '../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../domain/bloc/history/history_pra_cubit.dart';
import '../main.dart';
import '../screen/choose_sign/choose_sign_screen.dart';
import '../screen/test_screen/test_screen.dart';

class Routers {
  static const String chooseSign = '/choose_sign';
  static const String chooseOption = '/choose_option';
  static const String welcome = '/';
  static const String doTest = '/doTest';
  static const String game = '/game';
  static const String trueFalse = '/truefalse';
  static const String home = '/home';
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String historyHome = '/historyHome';
  static const String premake = '/premake';
  static const String detailTest = '/detailTest';
  static const String checkAnswer = '/checkAnswer';

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
      case home:
        return HomeScreen();
      case chooseSign:
        return const ChooseSignScreen();
      case chooseOption:
        return const OptionScreen();
      case premake:
        return BlocProvider(
            create: (context) => PreQuizCubit(
                preQuizLocalRepo: instance.get<PreQuizLocalRepo>()),
            child: PreMakeQuiz());
      case game:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizPraLocalRepo>()),
            child: GameScreen());
      case trueFalse:
        return BlocProvider(
            create: (context) =>
                GameCubit(quizPraLocalRepo: instance.get<QuizPraLocalRepo>()),
            child: const TrueFalseScreen());
      case doTest:
        return BlocProvider(
            create: (context) =>
                TestCubit(testLocalRepo: instance.get<TestLocalRepo>()),
            child: const TestScreen());
      case detailTest:
        return const DetailTestScreen();
      case historyHome:
        return const HistoryHome();
      case checkAnswer:
        return const CheckAnswerScreen();
      case historyPra:
        return BlocProvider(
            create: (context) => HistoryPraCubit(
                preQuizLocalRepo: instance.get<PreQuizLocalRepo>()),
            child: const HistoryPractice());
      case historyTest:
        return BlocProvider(
            create: (context) => HistoryTestCubit(
                preTestLocalRepo: instance.get<PreTestLocalRepo>()),
            child: const HistoryTest());
      default:
        return HomeScreen();
    }
  }
}
