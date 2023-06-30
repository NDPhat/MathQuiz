import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo_impl.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/domain/bloc/add_notifi/add_notifi_cubit.dart';
import 'package:math/domain/bloc/forget_pass/forget_pass_cubit.dart';

import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/domain/bloc/get_otp/get_otp_cubit.dart';
import 'package:math/domain/bloc/history/history_test_cubit.dart';
import 'package:math/domain/bloc/login/login_cubit.dart';
import 'package:math/domain/bloc/notifi_local/notifi_cubit.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/domain/bloc/test/test_cubit.dart';
import 'package:math/domain/bloc/update_pass/update_pass_cubit.dart';
import 'package:math/domain/bloc/update_profile/update_profile_cubit.dart';
import 'package:math/presentation/screen/check_answer/check_answer_hw.dart';
import 'package:math/presentation/screen/check_answer/check_answer_prac_screen.dart';
import 'package:math/presentation/screen/detail_quiz_game_screen/detail_quiz_game.dart';
import 'package:math/presentation/screen/game_screen/sentences_game_screen.dart';
import 'package:math/presentation/screen/get_otp/get_otp_screen.dart';
import 'package:math/presentation/screen/home/home_user.dart';
import 'package:math/presentation/screen/login/login_screen.dart';
import 'package:math/presentation/screen/notificaiton/notification_main_screen.dart';
import 'package:math/presentation/screen/option_use_app/option_use_app.dart';
import 'package:math/presentation/screen/pratice_game_user/practice_game_user_main_screen.dart';
import 'package:math/presentation/screen/setting/setting_main_screen.dart';
import 'package:math/presentation/screen/testing_user/test_main_user_screen.dart';
import 'package:math/presentation/screen/update_pass_word/update_pass_screen.dart';

import '../../data/local/repo/detail_notifi/detail_notifi_repo.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../domain/bloc/history/history_pra_cubit.dart';
import '../../main.dart';
import '../screen/check_answer/check_anwser_screen.dart';
import '../screen/detail_item_card_home/detail_hw_card_home_screen.dart';
import '../screen/detail_item_card_home/detail_practices_card_home_screen.dart';
import '../screen/detail_item_card_home/detail_test_home_screen.dart';
import '../screen/detail_test/detail_test_screen.dart';
import '../screen/dual/dual_main_screen.dart';
import '../screen/dual/dual_with_bot_screen.dart';
import '../screen/dual/dual_with_player_screen.dart';

import '../screen/dual/option_bot_dual.dart';
import '../screen/forget_password/forget_password_screen.dart';
import '../screen/game_screen/basic_game_screen.dart';
import '../screen/game_screen/find_missing.dart';
import '../screen/game_screen/true_false_screen.dart';
import '../screen/history/history_pratice_screen.dart';
import '../screen/history/history_test_screen.dart';
import '../screen/home/home_guest.dart';
import '../screen/home_work/home_work_user_game_screen.dart';
import '../screen/notificaiton/widget/add_notifi_local_screen.dart';
import '../screen/option_game_mode/option_game_mode_screen.dart';
import '../screen/option_game_mode/option_sign_screen.dart';
import '../screen/pratice_game_user/widget/practice_number_game_user_main_screen.dart';
import '../screen/pratice_game_user/widget/practice_sentences_game_user_main_screen.dart';
import '../screen/pre_quiz/pre_quiz_game.dart';
import '../screen/profile_user/my_account/profile_myaccount.dart';
import '../screen/test_screen/test_exam_screen.dart';
import '../screen/test_screen/test_practice_screen.dart';
import '../screen/testing_user/testing_game_user_screen.dart';
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
  static const String updateProfileUser = '/updateProfileUser';
  static const String trueFalse = '/truefalse';
  static const String forgetPass = '/forgetPass';
  static const String battleMainScreen = '/battleMainScreen';
  static const String settingScreen = '/settingScreen';
  static const String getOTP = '/getOTP';
  static const String updatePass = '/updatePass';
  static const String battleHuman = '/battleHuman';
  static const String battleBOT = '/battleBOT';
  static const String optionBot = '/optionBot';
  static const String findMissing = '/findMissing';
  static const String homeGuest = '/homeGuest';
  static const String homeUser = '/homeUser';
  static const String gameScreenUser = '/gameScreenUser';
  static const String senGameScreen = '/senGameScreen';
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String historyHome = '/historyHome';
  static const String hwcardDetail = '/hwcardDetail';
  static const String testDetail = '/testDetail';
  static const String practicecardDetail = '/practicecardDetail';
  static const String premake = '/premake';
  static const String detailTest = '/detailTest';
  static const String mainTestUser = '/mainTestUser';
  static const String testingUser = '/testingUser';
  static const String checkAnswer = '/checkAnswer';
  static const String checkAnswerHW = '/checkAnswerHW';
  static const String notifiScreen = '/notifiScreen';
  static const String addNotifiScreen = '/addNotifiScreen';
  static const String checkAnswerPracUserGame = '/checkAnswerPracUserGame';
  static const String detailQuizGame = '/detailQuizGame';
  static const String homeworkGame = '/homeworkGame';
  static const String practiceMainScreenUserGame =
      '/practiceMainScreenUserGame';
  static const String practiceScreenUserGameNum = '/practiceScreenUserGameNum';
  static const String practiceMainScreenUserGameSen =
      '/practiceScreenUserGameSen';

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
      case checkAnswerPracUserGame:
        return CheckAnswerPracUserGameScreen();
      case notifiScreen:
        return BlocProvider(
            create: (context) =>
                NotifiCubit(notifiLocalRepo: instance.get<NotifiLocalRepo>()),
            child: LocalNotifiMainScreen());
      case addNotifiScreen:
        return BlocProvider(
            create: (context) => AddNotifiCubit(
                  detailNotifiLocalRepo: instance.get<DetailNotifiLocalRepo>(),
                ),
            child: AddNotifiScreen());
      case hwcardDetail:
        return DetailItemCardHomeWork();
      case practiceMainScreenUserGameSen:
        return PracticeSenGameUserScreen();
      case practiceScreenUserGameNum:
        return PracticeNumberGameUserScreen();
      case practiceMainScreenUserGame:
        return PracticeGameUserMainScreen();
      case testDetail:
        return DetailTestHomeWork();
      case mainTestUser:
        return MainTestingUserScreen();
      case settingScreen:
        return SettingMainScreen();
      case practicecardDetail:
        return DetailItemCardPractices();
      case updateProfileUser:
        return BlocProvider(
            create: (context) =>
                UpdateProfileCubit(userAPIRepo: instance.get<UserAPIRepo>()),
            child: UpdateProfileUserScreen());
      case login:
        return BlocProvider(
            create: (context) => LoginCubit(
                userAPIRepo: instance.get<UserAPIRepo>(),
                authenRepository: instance.get<AuthenRepository>()),
            child: LoginUserApp());
      case forgetPass:
        return BlocProvider(
            create: (context) =>
                ForgetPassCubit(userAPIRepo: instance.get<UserAPIRepo>()),
            child: const ForgetPassScreen());
      case getOTP:
        return BlocProvider(
            create: (context) =>
                GetOTPCubit(userAPIRepo: instance.get<UserAPIRepo>()),
            child: GetOTPScreen());
      case updatePass:
        return BlocProvider(
            create: (context) =>
                UpdatePassCubit(userAPIRepo: instance.get<UserAPIRepo>()),
            child: UpdatePasswordScreen());
      case chooseOptionUseApp:
        return OptionUseApp();
      case homeworkGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: HomeWorkGameScreen());
      case testingUser:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: TestTingUserGameScreen());
      case homeGuest:
        return HomeGuestScreen();
      case homeUser:
        return HomeUserScreen();
      case checkAnswerHW:
        return CheckAnswerHWScreen();
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
            create: (context) => PreQuizCubit(
                preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: PreMakeQuizGame());
      case game:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: GameScreen());
      case trueFalse:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const TrueFalseScreen());
      case battleMainScreen:
        return const DualMainScreen();
      case battleHuman:
        return const PlayerDual();
      case findMissing:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const FindMissing());
      case senGameScreen:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: SentencesGameScreen());
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
        return WelcomeScreen();
    }
  }
}
