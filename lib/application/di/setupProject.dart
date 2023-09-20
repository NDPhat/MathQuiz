import 'package:math/data/model/user_global.dart';
import 'package:math/main.dart';
import 'package:background_fetch/background_fetch.dart';
import '../../data/local/notifi/notifi_helper.dart';
import '../../data/local/repo/pre_quiz/pre_pra_local_repo.dart';
import '../../data/local/repo/pre_test/pre_test__local_repo.dart';
import '../utils/network.dart';
import 'initDB.dart';
import 'package:get/get.dart';

Future<void> setUpProject() async {
  /// INIT REOI
  initDBandLocalRepo();

  /// INIT LOCAL NOTIFY
  await NotifyHelper().initializeNotification();

  /// INIT CHECK NETWORK
  if (instance.get<UserGlobal>().onLogin == true) {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }

  /// CLEAR OLD DATA
  BackgroundFetch.registerHeadlessTask(startBackgroundTask);
  startBackgroundTask();
}

void startBackgroundTask() {
  BackgroundFetch.configure(
    BackgroundFetchConfig(minimumFetchInterval: 15),
    (String taskId) async {
      await deleteOldData();
      BackgroundFetch.finish(taskId);
    },
  );
  BackgroundFetch.start();
}

Future<void> deleteOldData() async {
  await instance.get<PrePraLocalRepo>().deleteAllPreQuizGameAfter7DaysFromNow();
  await instance.get<PreTestLocalRepo>().deleteAllPreTestAfter7DaysFromNow();
}
