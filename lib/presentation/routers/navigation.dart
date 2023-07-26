import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
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
import 'package:math/domain/bloc/update_pass/update_pass_cubit.dart';
import 'package:math/domain/bloc/update_profile/update_profile_cubit.dart';
import 'package:math/presentation/screen/add_new_guest_player/add_new_guest_player_screen.dart';
import 'package:math/presentation/screen/change_pass_word/change_pass_word_screen.dart';
import 'package:math/presentation/screen/check_answer/check_answer_hw_test.dart';
import 'package:math/presentation/screen/check_answer/check_answer_prac_screen.dart';
import 'package:math/presentation/screen/data_sheet_screen/data_sheet_user/data_sheet_user_screen.dart';
import 'package:math/presentation/screen/detail_quiz_game_screen/detail_quiz_game.dart';
import 'package:math/presentation/screen/game_screen/hard_game/drag_drop_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/match_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_and_count_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_missing_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/hard_game/mix_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/medium_game/enter_answer_game_screen.dart';
import 'package:math/presentation/screen/game_screen/medium_game/find_number_game_screen.dart';
import 'package:math/presentation/screen/game_screen/hard_game/puzzle_game_screen.dart';
import 'package:math/presentation/screen/game_screen/medium_game/true_false_game_screen.dart';
import 'package:math/presentation/screen/get_otp/get_otp_screen.dart';
import 'package:math/presentation/screen/home_work/assignment_game_screen.dart';
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
import '../../data/local/repo/test/quiz_test_repo.dart';
import '../../domain/bloc/history/history_pra_cubit.dart';
import '../../domain/bloc/take_hard/take_hard_cubit.dart';
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
import '../screen/home_work/assignment_main_screen.dart';
import '../screen/notificaiton/widget/add_notifi_local_screen.dart';
import '../screen/option_game_mode/option_game_mode_screen.dart';
import '../screen/profile_user/home_profile_user_screen.dart';
import '../screen/profile_user/my_account/profile_myaccount.dart';
import '../screen/take_quiz_user_screen/take_quiz_user_main_screen.dart';
import '../screen/take_quiz_user_screen/widget/take_quiz_easy_screen.dart';

class Routers {
  static const String chooseOption = '/choose_option';
  static const String chooseOptionUseApp = '/choose_option_use_app';
  static const String splash = 'splash';
  static const String login = '/login';
  static const String intro = '/intro';
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
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String historyHome = '/historyHome';
  static const String hwcardDetail = '/hwcardDetail';
  static const String testDetail = '/testDetail';
  static const String practicecardDetail = '/practicecardDetail';
  static const String detailTest = '/detailTest';
  static const String mainTestUser = '/mainTestUser';
  static const String checkAnswer = '/checkAnswer';
  static const String checkAnswerHWAndTest = '/checkAnswerHWAndTest';
  static const String notifiScreen = '/notifiScreen';
  static const String addNotifiScreen = '/addNotifiScreen';
  static const String addPlayer = '/addPlayer';
  static const String checkAnswerPracUserGame = '/checkAnswerPracUserGame';
  static const String detailQuizGame = '/detailQuizGame';
  static const String takeEasyQuiz = '/takeEasyQuiz';
  static const String takeMediumQuiz = '/takeMediumQuiz';
  static const String takeHardQuiz = '/takeHardQuiz';
  static const String assignmentGameScreen = '/assignmentGameScreen';
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
  static const String mixGame = '/mixGame';
  static const String assignmentMainScreen = '/assignmentMainScreen';
  static const String dataSheetScreen = '/dataSheetScreen';
  static const String profileScreen = '/profileScreen';
  static const String changePassScreen = '/changePassScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return const IntroScreen();
      case splash:
        return const SplashScreen();
      case languageScreen:
        return const LanguageScreen();
      case takeEasyQuiz:
        return const TakeQuizEasyScreen();
      case writeNumGame:
        return WriteNumberBoardGame();
      case writeAndCountNumGame:
        return WriteAndCountGameScreen();
      case writeMissing:
        return WriteMissingNumberGameScreen();
      case profileScreen:
        return HomeProfileUserScreen();
      case matchNumber:
        return const MatchNumberGameScreen();
      case changePassScreen:
        return BlocProvider(
            create: (context) => UpdatePassCubit(
                  userAPIRepo: instance.get<UserAPIRepo>(),
                ),
            child: const ChangePassWordScreen());
      case takeMediumQuiz:
        return const TakeQuizMediumScreen();
      case takeHardQuiz:
        return BlocProvider(
            create: (context) => TakeHardCubit(
                userAPIRepo: instance.get<UserAPIRepo>(),
                preTestLocalRepo: instance.get<PreTestLocalRepo>()),
            child: const TakeQuizHardScreen());
      case checkAnswerPracUserGame:
        return const CheckAnswerPracUserGameScreen();
      case notifiScreen:
        return BlocProvider(
            create: (context) =>
                NotifiCubit(notifiLocalRepo: instance.get<NotifiLocalRepo>()),
            child: const LocalNotifiMainScreen());
      case addPlayer:
        return BlocProvider(
            create: (context) => AddPlayerCubit(
                playerLocalRepo: instance.get<PlayerLocalRepo>()),
            child: const AddNewGuestPlayerScreen());
      case addNotifiScreen:
        return BlocProvider(
            create: (context) => AddNotifiCubit(
                  detailNotifiLocalRepo: instance.get<DetailNotifiLocalRepo>(),
                ),
            child: AddNotifiScreen());
      case hwcardDetail:
        return const DetailItemCardHomeWork();
      case takeQuiz:
        return const TakeQuizUserScreen();
      case testDetail:
        return const DetailTestHomeWork();
      case mainTestUser:
        return const MainTestingUserScreen();
      case settingScreen:
        return const SettingMainScreen();
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
            child: const LoginUserApp());
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
            child: const UpdatePasswordScreen());
      case chooseOptionUseApp:
        return const OptionUseApp();
      case assignmentGameScreen:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const AssignmentGameScreen());
      case homeGuest:
        return const HomeGuestMainScreen();
      case homeUser:
        return const HomeUserScreen();
      case checkAnswerHWAndTest:
        return const CheckAnswerHWAndTestScreen();
      case battleBOT:
        return const BotDual();
      case dataSheetScreen:
        return const DataSheetUserScreen();
      case optionBot:
        return OptionModeBotDual();
      case chooseOption:
        return BlocProvider(
            create: (context) => PreQuizCubit(
                preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
                userAPIRepo: instance.get<UserAPIRepo>()),
            child: const OptionGameModeScreen());
      case battleMainScreen:
        return const DualMainScreen();
      case battleHuman:
        return const PlayerDual();
      case mixGame:
        return BlocProvider(
            create: (context) => GameCubit(
                userAPIRepo: instance.get<UserAPIRepo>(),
                quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                quizPraLocalRepo: instance.get<QuizGameLocalRepo>()),
            child: const MixNumberGameScreen());
      case detailTest:
        return const DetailTestScreen();
      case assignmentMainScreen:
        return const AssignmentMainScreen();
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
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const EnterAnswerGameScreen());
      case tfGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const TrueFalseGameScreen());
      case missingGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const FindMissingNumberGameScreen());
      case puzzleGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const PuzzleGameScreen());
      case dragDropGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  userAPIRepo: instance.get<UserAPIRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const DragDropGameScreen());
      default:
        return const SplashScreen();
    }
  }
}
