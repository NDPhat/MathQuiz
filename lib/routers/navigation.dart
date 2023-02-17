import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/domain/bloc/check_answer/history_cubit.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/screen/check_answer/check_anwser_screen.dart';
import 'package:math/screen/game_screen/game_screen.dart';
import 'package:math/screen/history/history_screen.dart';
import 'package:math/screen/home/home_screen.dart';
import 'package:math/screen/pre_quiz/pre_quiz.dart';
import 'package:math/screen/welcome_screen.dart';

import '../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../main.dart';
import '../screen/choose_sign/choose_sign_screen.dart';
import '../screen/test_screen/test_screen.dart';

class Routers {
  static const String chooseSign = '/choose_sign';
  static const String welcome = '/';
  static const String doTest = '/doTest';
  static const String game = '/game';
  static const String home = '/home';
  static const String history = '/history';
  static const String premake = '/premake';
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
        return const HomeScreen();
      case chooseSign:
        return const ChooseSignScreen();
      case premake:
        return BlocProvider(
            create: (context) => PreQuizCubit(
                preQuizLocalRepo: instance.get<PreQuizLocalRepo>()),
            child: PreMakeQuiz());
      case game:
        return GameScreen();
      case doTest:
        return const TestScreen();
      case checkAnswer:
        return const CheckAnswerScreen();
      case history:
        return BlocProvider(
            create: (context) => HistoryCubit(
                preQuizLocalRepo: instance.get<PreQuizLocalRepo>()),
            child: const History());

      default:
        return const HomeScreen();
    }
  }
}
