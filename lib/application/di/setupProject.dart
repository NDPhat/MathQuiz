import '../../data/local/notifi/notifi_helper.dart';
import 'initDB.dart';

Future<void> setUpProject() async {
  initDBandLocalRepo();
  await NotifyHelper().initializeNotification();
}
