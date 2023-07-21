import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/domain/bloc/add_notifi/add_notifi_cubit.dart';
import 'package:math/domain/bloc/add_player/add_player_cubit.dart';
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
import 'package:math/presentation/screen/add_new_guest_player/add_new_guest_player_screen.dart';
import 'package:math/presentation/screen/check_answer/check_answer_hw.dart';
import 'package:math/presentation/screen/check_answer/check_answer_prac_screen.dart';
import 'package:math/presentation/screen/detail_quiz_game_screen/detail_quiz_game.dart';
import 'package:math/presentation/screen/game_screen/drag_drop_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/match_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_and_count_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_missing_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/enter_answer_game_screen.dart';
import 'package:math/presentation/screen/game_screen/find_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/puzzle_game_screen.dart';
import 'package:math/presentation/screen/game_screen/true_false_game_screen.dart';
import 'package:math/presentation/screen/get_otp/get_otp_screen.dart';
import 'package:math/presentation/screen/intro/intro_screen.dart';
import 'package:math/presentation/screen/language_screen/language_screen.dart';
import 'package:math/presentation/screen/login/login_screen.dart';
import 'package:math/presentation/screen/notificaiton/notification_main_screen.dart';
import 'package:math/presentation/screen/option_use_app/option_use_app.dart';
import 'package:math/presentation/screen/setting/setting_main_screen.dart';
import 'package:math/presentation/screen/splash_screen/splash_screen.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/take_quiz_hard_screen.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/take_quiz_medium_screen.dart';
import 'package:math/presentation/screen/testing_user/test_main_user_screen.dart';
import 'package:math/presentation/screen/update_pass_word/update_pass_screen.dart';
import '../../data/local/repo/detail_notifi/detail_notifi_repo.dart';
import '../../data/local/repo/player_local/player_local_repo.dart';
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
import '../screen/history/history_pratice_screen.dart';
import '../screen/history/history_test_screen.dart';
import '../screen/home/guest_home_screen/home_guest_screen.dart';
import '../screen/home/user_home_screen/home_user_screen.dart';
import '../screen/home_work/home_work_user_game_screen.dart';
import '../screen/notificaiton/widget/add_notifi_local_screen.dart';
import '../screen/option_game_mode/option_game_mode_screen.dart';
import '../screen/profile_user/my_account/profile_myaccount.dart';
import '../screen/take_quiz_user_screen/take_quiz_user_main_screen.dart';
import '../screen/take_quiz_user_screen/widget/practice_number_game_user_main_screen.dart';
import '../screen/take_quiz_user_screen/widget/take_quiz_easy_screen.dart';
import '../screen/test_screen/test_practice_screen.dart';
import '../screen/testing_user/testing_game_user_screen.dart';

class Routers {
  static const String chooseOption = '/choose_option';
  static const String chooseOptionUseApp = '/choose_option_use_app';
  static const String splash = 'splash';
  static const String login = '/login';
  static const String intro = '/intro';
  static const String doTestPra = '/doTestPra';
  static const String updateProfileUser = '/updateProfileUser';
  static const String forgetPass = '/forgetPass';
  static const String battleMainScreen = '/battleMainScreen';
  static const String settingScreen = '/settingScreen';
  static const String getOTP = '/getOTP';
  static const String updatePass = '/updatePass';
  static const String battleHuman = '/battleHuman';
  static const String battleBOT = '/battleBOT';
  static const String optionBot = '/optionBot';
  static const String homeGuest = '/homeGuest';
  static const String homeUser = '/homeUser';
  static const String gameScreenUser = '/gameScreenUser';
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String historyHome = '/historyHome';
  static const String hwcardDetail = '/hwcardDetail';
  static const String testDetail = '/testDetail';
  static const String practicecardDetail = '/practicecardDetail';
  static const String detailTest = '/detailTest';
  static const String mainTestUser = '/mainTestUser';
  static const String testingUser = '/testingUser';
  static const String checkAnswer = '/checkAnswer';
  static const String checkAnswerHW = '/checkAnswerHW';
  static const String notifiScreen = '/notifiScreen';
  static const String addNotifiScreen = '/addNotifiScreen';
  static const String addPlayer = '/addPlayer';
  static const String checkAnswerPracUserGame = '/checkAnswerPracUserGame';
  static const String detailQuizGame = '/detailQuizGame';
  static const String takeEasyQuiz = '/takeEasyQuiz';
  static const String takeMediumQuiz = '/takeMediumQuiz';
  static const String takeHardQuiz = '/takeHardQuiz';
  static const String homeworkGame = '/homeworkGame';
  static const String languageScreen = '/languageScreen';
  static const String takeQuiz = '/takeQuiz';
  static const String enterAnswerGame = '/enterAnswerGame';
  static const String tfGame = '/tfGame';
  static const String missingGame = '/missingGame';
  static const String puzzleGame = '/puzzleGame';
  static const String dragDropGame = '/dragDropGame';
  static const String writeNumGame = '/writeNumGame';
  static const String writeAndCountNumGame = '/writeAndCountNumGame';
  static const String writeMissing = '/writeMissing';
  static const String matchNumber = '/matchNumber';
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
      case intro:
        return IntroScreen();
      case splash:
        return SplashScreen();
      case languageScreen:
        return LanguageScreen();
      case takeEasyQuiz:
        return TakeQuizEasyScreen();
      case writeNumGame:
        return WriteNumberBoardGame();
      case writeAndCountNumGame:
        return WriteAndCountGameScreen();
      case writeMissing:
        return WriteMissingNumberGameScreen();
      case matchNumber:
        return MatchNumberGameScreen();
      case takeMediumQuiz:
        return TakeQuizMediumScreen();
      case takeHardQuiz:
        return TakeQuizHardScreen();
      case checkAnswerPracUserGame:
        return CheckAnswerPracUserGameScreen();
      case notifiScreen:
        return BlocProvider(
            create: (context) =>
                NotifiCubit(notifiLocalRepo: instance.get<NotifiLocalRepo>()),
            child: LocalNotifiMainScreen());
      case addPlayer:
        return BlocProvider(
            create: (context) => AddPlayerCubit(
                playerLocalRepo: instance.get<PlayerLocalRepo>()),
            child: AddNewGuestPlayerScreen());
      case addNotifiScreen:
        return BlocProvider(
            create: (context) => AddNotifiCubit(
                  detailNotifiLocalRepo: instance.get<DetailNotifiLocalRepo>(),
                ),
            child: AddNotifiScreen());
      case hwcardDetail:
        return DetailItemCardHomeWork();
      case practiceScreenUserGameNum:
        return PracticeNumberGameUserScreen();
      case takeQuiz:
        return TakeQuizUserScreen();
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
        return HomeGuestMainScreen();
      case homeUser:
        return HomeUserScreen();
      case checkAnswerHW:
        return CheckAnswerHWScreen();
      case battleBOT:
        return const BotDual();
      case optionBot:
        return OptionModeBotDual();
      case chooseOption:
        return BlocProvider(
            create: (context) => PreQuizCubit(
                preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: OptionGameModeScreen());
      case battleMainScreen:
        return const DualMainScreen();
      case battleHuman:
        return const PlayerDual();
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
      case enterAnswerGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const EnterAnswerGameScreen());
      case tfGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const TrueFalseGameScreen());
      case missingGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const FindMissingNumberGameScreen());
      case puzzleGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const PuzzleGameScreen());
      case dragDropGame:
        return BlocProvider(
            create: (context) => GameCubit(
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const DragDropGameScreen());
      default:
        return SplashScreen();
    }
  }
}
