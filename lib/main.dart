// import 'dart:html';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:device_preview/device_preview.dart';
import 'application/di/setupProject.dart';
import 'l10n/l2n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        // supportedLocales: L10n.all,
        // localizationsDelegates: [
        //   AppLocalizations.delegate, // Add this line
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Routers.welcome,
      ),
    );
  }
}
