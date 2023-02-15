import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/prequizrepo.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/screen/game_screen/game_screen.dart';
import 'package:math/screen/pre_quiz/pre_quiz.dart';
import 'package:math/screen/welcome_screen.dart';
import '../screen/home/home_screen.dart';

class Routers {
  static const String home = '/home';
  static const String welcome = '/';
  static const String game = '/game';
  static const String premake = '/premake';

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
      case premake:
        return BlocProvider(
            create: (context) => PreQuizCubit(preQuizLocalRepo: PreQuizLocalRepo()
                ),
            child: PreMakeQuiz());
      case game:
        return GameScreen();

      default:
        return const HomeScreen();
    }
  }
}
