import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';
import 'application/di/setupProject.dart';

GetIt instance = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setUpProject();
  runApp(DevicePreview(
    builder: (context) => EasyLocalization(
        supportedLocales: const [
          Locale("vi", "VI"),
          Locale("en", "EN"),
        ],
        path: "resources/langs",
        saveLocale: true,
        child: const MathQuizApp()), // Wrap your app
  ));
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
          child: MaterialApp(
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
