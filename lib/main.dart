import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:math/presentation/screen/restart_app/restart_app_widget.dart';
import 'package:sizer/sizer.dart';
import 'application/di/setupProject.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

GetIt instance = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// PERMISSION LOCAL NOTIFICATION
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  ///INIT DB AND DECLARE VARIABLE
  setUpProject();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// LANGUAGE
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale("vi", "VI"),
        Locale("en", "EN"),
      ],
      path: "resources/langs",
      saveLocale: true,
      fallbackLocale: const Locale("en", "EN"),
      child: const RestartWidget(child: MathQuizApp())));
}

class MathQuizApp extends StatelessWidget {
  const MathQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Sizer(builder: (context, orientation, device) {
      return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            theme: ThemeData.from(
              colorScheme: const ColorScheme.light(),
            ).copyWith(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                },
              ),
            ),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            onGenerateRoute: Routers.generateRoute,
            initialRoute: Routers.splash,
          ));
    });
  }
}
