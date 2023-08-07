import 'package:shared_preferences/shared_preferences.dart';

class AuthenRepository {
  Future<bool> loadHandleAutoLoginApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("flagAutoLogin") ?? false;
  }

  Future<bool> loadHandleLocalAutoLoginApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("flagLocalAutoLogin") ?? false;
  }

  Future<bool> loadHandleFirstTimeUsingApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("flagIntro") ?? false;
  }

  Future<bool> loadHandleFirstTimeShowUserManualDragDrop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("showUserManual") ?? true;
  }

  Future<bool> loadHandleFirstTimeShowUserManualPuzzle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("showUserManualPuzzle") ?? true;
  }

  Future<String> getMailHandleAutoLoginApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mail") ?? "";
  }

  Future<int> getIDLocalHandleAutoLoginApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("idLocal") ?? 1;
  }

  void handleAutoLoginApp(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("flagAutoLogin", value);
    });
  }

  void handleLocalAutoLoginApp(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("flagLocalAutoLogin", value);
    });
  }

  void handleFirstTimeUsingApp(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("flagIntro", value);
    });
  }

  void handleFirstTimeDragDropUserManual(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("showUserManual", value);
    });
  }

  void handleFirstTimePuzzleUserManual(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("showUserManualPuzzle", value);
    });
  }

  void handleIDLocalPlayerLoginApp(int value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt("idLocal", value);
    });
  }

  void handleMailLoginApp(String value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("mail", value);
    });
  }
}
