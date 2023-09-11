import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/model/app_global.dart';
import 'package:math/data/remote/api/Repo/pre_test_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_hw_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_pra_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';
import 'package:math/data/remote/api/Repo/user_repo.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/domain/bloc/add_notifi/add_notify_cubit.dart';
import 'package:math/domain/bloc/add_player/add_player_cubit.dart';
import 'package:math/domain/bloc/detail_test/detail_test_cubit.dart';
import 'package:math/domain/bloc/forget_pass/forget_pass_cubit.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/domain/bloc/get_otp/get_otp_cubit.dart';
import 'package:math/domain/bloc/hw/hw_cubit.dart';
import 'package:math/domain/bloc/login/login_cubit.dart';
import 'package:math/domain/bloc/notify_main/notify_main_cubit.dart';
import 'package:math/domain/bloc/setting/setting_cubit.dart';
import 'package:math/domain/bloc/update_pass/update_pass_cubit.dart';
import 'package:math/domain/bloc/update_profile/update_profile_cubit.dart';
import 'package:math/presentation/screen/add_new_guest_player/add_new_guest_player_screen.dart';
import 'package:math/presentation/screen/change_pass_word/change_pass_word_screen.dart';
import 'package:math/presentation/screen/check_answer/check_answer_prac_screen.dart';
import 'package:math/presentation/screen/check_answer/check_answer_test_screen.dart';
import 'package:math/presentation/screen/data_sheet_screen/data_sheet_guest/data_sheet_guest_screen.dart';
import 'package:math/presentation/screen/data_sheet_screen/data_sheet_user/data_sheet_user_screen.dart';
import 'package:math/presentation/screen/detail_quiz_guest/detail_quiz_game.dart';
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
import 'package:math/presentation/screen/setting_guest/setting_guest_screen.dart';
import 'package:math/presentation/screen/splash_screen/splash_screen.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/take_quiz_hard_screen.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/take_quiz_medium_screen.dart';
import 'package:math/presentation/screen/update_forget%20_pass_word/update_forget_pass_screen.dart';
import '../../data/local/repo/detail_notifi/notify_task_repo.dart';
import '../../data/local/repo/player_local/player_local_repo.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../data/local/repo/test/quiz_test_repo.dart';
import '../../data/remote/api/Repo/pre_pra_repo.dart';
import '../../domain/bloc/detail_practices/detail_practices_cubit.dart';
import '../../domain/bloc/history/history_cubit.dart';
import '../../domain/bloc/pre_practice/pre_pra_cubit.dart';
import '../../domain/bloc/take_hard/take_hard_cubit.dart';
import '../../main.dart';
import '../screen/check_answer/check_answer_hw.dart';
import '../screen/detail_item_card_home/detail_hw_card_home_screen.dart';
import '../screen/detail_item_card_home/detail_practices_card_home_screen.dart';
import '../screen/detail_item_card_home/detail_test_home_screen.dart';
import '../screen/detail_quiz_guest/detail_test_screen.dart';
import '../screen/dual/dual_main_screen.dart';
import '../screen/dual/dual_with_bot_screen.dart';
import '../screen/dual/dual_with_player_screen.dart';
import '../screen/dual/option_bot_dual.dart';
import '../screen/forget_password/forget_password_screen.dart';
import '../screen/history_guest/history_pratice_screen.dart';
import '../screen/history_guest/history_test_screen.dart';
import '../screen/home/guest_home_screen/home_guest_screen.dart';
import '../screen/home/user_home_screen/home_user_screen.dart';
import '../screen/home_work/assignment_main_screen.dart';
import '../screen/notificaiton/widget/add_notifi_local_screen.dart';
import '../screen/option_game_mode/option_game_mode_screen.dart';
import '../screen/profile_user/home_profile_user_screen.dart';
import '../screen/profile_user/my_account/profile_myaccount.dart';
import '../screen/record_guest/record_guest_screen.dart';
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
  static const String settingGuestScreen = '/settingGuestScreen';
  static const String recordGuest = '/recordGuest';
  static const String getOTP = '/getOTP';
  static const String updatePass = '/updatePass';
  static const String battleHuman = '/battleHuman';
  static const String battleBOT = '/battleBOT';
  static const String optionBot = '/optionBot';
  static const String homeGuest = '/homeGuest';
  static const String homeUser = '/homeUser';
  static const String historyPra = '/historyPra';
  static const String historyTest = '/historyTest';
  static const String hwcardDetail = '/hwcardDetail';
  static const String testDetail = '/testDetail';
  static const String practicecardDetail = '/practicecardDetail';
  static const String detailTest = '/detailTest';
  static const String checkAnswer = '/checkAnswer';
  static const String checkAnswerHW = '/checkAnswerHW';
  static const String checkAnswerTest = '/checkAnswerTest';
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
  static const String dataSheetGuestScreen = '/dataSheetGuestScreen';
  static const String profileScreen = '/profileScreen';
  static const String changePassScreen = '/changePassScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route(settings),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
      settings:
          RouteSettings(name: settings.name, arguments: settings.arguments),
    );
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
        return const HomeProfileUserScreen();
      case matchNumber:
        return const MatchNumberGameScreen();
      case changePassScreen:
        return BlocProvider(
            create: (context) => UpdatePassCubit(
                  userRepo: instance.get<UserRepo>(),
                ),
            child: const ChangePassWordScreen());
      case takeMediumQuiz:
        return const TakeQuizMediumScreen();
      case addNotifiScreen:
        return BlocProvider(
            create: (context) => AddNotifyCubit(
                notifyTaskRepo: instance.get<NotifyTaskLocalRepo>()),
            child: AddNotifyScreen());
      case takeHardQuiz:
        return BlocProvider(
            create: (context) => TakeHardCubit(
                preTestRepo: instance.get<PreTestRepo>(),
                preTestLocalRepo: instance.get<PreTestLocalRepo>()),
            child: const TakeQuizHardScreen());
      case checkAnswerPracUserGame:
        return const CheckAnswerPracUserGameScreen();
      case notifiScreen:
        return BlocProvider(
            create: (context) => NotifyMainCubit(
                notifyTaskLocalRepo: instance.get<NotifyTaskLocalRepo>()),
            child: const LocalNotifyMainScreen());
      case addPlayer:
        return BlocProvider(
            create: (context) => AddPlayerCubit(
                playerLocalRepo: instance.get<PlayerLocalRepo>()),
            child: const AddNewGuestPlayerScreen());
      case hwcardDetail:
        return const DetailItemCardHomeWork();
      case takeQuiz:
        return const TakeQuizUserScreen();

      case testDetail:
        return BlocProvider(
            create: (context) =>
                DetailTestCubit(preTestRepo: instance.get<PreTestRepo>()),
            child: const DetailMixGameScreen());
      case settingScreen:
        return BlocProvider(
            create: (context) =>
                SettingCubit(appGlobal: instance.get<AppGlobal>()),
            child: const SettingMainScreen());
      case settingGuestScreen:
        return BlocProvider(
            create: (context) =>
                SettingCubit(appGlobal: instance.get<AppGlobal>()),
            child: const SettingGuestMainScreen());
      case practicecardDetail:
        return BlocProvider(
            create: (context) =>
                DetailPracticesCubit(prePraRepo: instance.get<PrePraRepo>()),
            child: const DetailItemCardPractices());
      case updateProfileUser:
        return BlocProvider(
            create: (context) =>
                UpdateProfileCubit(userRepo: instance.get<UserRepo>()),
            child: const UpdateProfileUserScreen());
      case login:
        return BlocProvider(
            create: (context) => LoginCubit(
                userAPIRepo: instance.get<UserRepo>(),
                authenRepository: instance.get<AuthenRepository>()),
            child: const LoginUserApp());
      case forgetPass:
        return BlocProvider(
            create: (context) =>
                ForgetPassCubit(userRepo: instance.get<UserRepo>()),
            child: const ForgetPassScreen());
      case getOTP:
        return BlocProvider(
            create: (context) =>
                GetOTPCubit(userRepo: instance.get<UserRepo>()),
            child: const GetOTPScreen());
      case updatePass:
        return BlocProvider(
            create: (context) =>
                UpdatePassCubit(userRepo: instance.get<UserRepo>()),
            child: const UpdateForgetPasswordScreen());
      case chooseOptionUseApp:
        return const OptionUseApp();
      case assignmentGameScreen:
        return BlocProvider(
            create: (context) => HWCubit(
                  resultHWRepo: instance.get<ResultHWRepo>(),
                  quizHWRepo: instance.get<QuizHWRepo>(),
                ),
            child: const AssignmentGameScreen());
      case homeGuest:
        return const HomeGuestMainScreen();
      case homeUser:
        return const HomeUserScreen();
      case checkAnswerHW:
        return const CheckAnswerHWScreen();
      case checkAnswerTest:
        return const CheckAnswerTestScreen();
      case recordGuest:
        return const RecordGuestScreen();
      case battleBOT:
        return const BotDual();
      case dataSheetScreen:
        return const DataSheetUserScreen();
      case dataSheetGuestScreen:
        return BlocProvider(
            create: (context) => HistoryCubit(
                preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                preQuizLocalRepo: instance.get<PrePraLocalRepo>()),
            child: const DataSheetGuestScreen());
      case optionBot:
        return const OptionModeBotDual();
      case chooseOption:
        return BlocProvider(
            create: (context) => PrePraCubit(
                preQuizLocalRepo: instance.get<PrePraLocalRepo>(),
                prePraRepo: instance.get<PrePraRepo>()),
            child: const OptionGameModeScreen());
      case battleMainScreen:
        return const DualMainScreen();
      case battleHuman:
        return const PlayerDual();
      case mixGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const MixNumberGameScreen());
      case detailTest:
        return const DetailTestScreen();
      case assignmentMainScreen:
        return const AssignmentMainScreen();
      case detailQuizGame:
        return const DetailQuizGame();
      case historyPra:
        return BlocProvider(
            create: (context) => HistoryCubit(
                preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                preQuizLocalRepo: instance.get<PrePraLocalRepo>()),
            child: const HistoryPractice());
      case historyTest:
        return BlocProvider(
            create: (context) => HistoryCubit(
                preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                preQuizLocalRepo: instance.get<PrePraLocalRepo>()),
            child: const HistoryTest());
      case enterAnswerGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const EnterAnswerGameScreen());
      case tfGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const TrueFalseGameScreen());
      case missingGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const FindMissingNumberGameScreen());
      case puzzleGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const PuzzleGameScreen());
      case dragDropGame:
        return BlocProvider(
            create: (context) => GameCubit(
                  quizPraLocalRepo: instance.get<QuizGameLocalRepo>(),
                  preTestRepo: instance.get<PreTestRepo>(),
                  prePraRepo: instance.get<PrePraRepo>(),
                  quizTestRepo: instance.get<QuizTestRepo>(),
                  quizPraRepo: instance.get<QuizPraRepo>(),
                  prePraLocalRepo: instance.get<PrePraLocalRepo>(),
                  preTestLocalRepo: instance.get<PreTestLocalRepo>(),
                  quizTestLocalRepo: instance.get<QuizTestLocalRepo>(),
                ),
            child: const DragDropGameScreen());
      default:
        return const SplashScreen();
    }
  }
}
