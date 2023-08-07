import 'package:flutter/material.dart';
import 'package:math/application/di/event_local.dart';
import 'package:math/data/local/repo/player_local/player_local_repo.dart';
import 'package:sizer/sizer.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/authen/authen.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleNavigationLoadApp();
  }

  void handleNavigationLoadApp() async {
    bool isUsing =
        await instance.get<AuthenRepository>().loadHandleFirstTimeUsingApp();
    bool isUserSignIn =
        await instance.get<AuthenRepository>().loadHandleAutoLoginApp();
    bool isLocalCreate =
        await instance.get<AuthenRepository>().loadHandleLocalAutoLoginApp();

    //first time install app
    if (isUsing == false) {
      instance.get<AuthenRepository>().handleFirstTimeUsingApp(true);
      Navigator.pushNamed(context, Routers.intro);
    }
    // da tung xai app bo qua intro
    else {
      //handle auto log in
      instance.get<UserGlobal>().onLogin = isUserSignIn;
      //user login
      if (isUserSignIn == true) {
        String email =
            await instance.get<AuthenRepository>().getMailHandleAutoLoginApp();
        await instance.get<UserAPIRepo>().getUserByEmail(email);
        Navigator.pushNamed(context, Routers.homeUser);
      }
      // user local
      else {
        if (isLocalCreate == true) {
          int id = await instance
              .get<AuthenRepository>()
              .getIDLocalHandleAutoLoginApp();
          PlayerLocalEntityData dataLocal;
          dataLocal =
              await instance.get<PlayerLocalRepo>().getPlayerLocal(id);
          if(dataLocal != null) {
            UserEventLocal.updateUserLocal(dataLocal);
            Navigator.pushNamed(context, Routers.homeGuest);
          }
          else{
            Navigator.pushNamed(context, Routers.addPlayer);

          }
        } else {
          Navigator.pushNamed(context, Routers.chooseOptionUseApp);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.all(5.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/t.jpg',
              ),
              fit: BoxFit.fill),
        ));
  }
}
