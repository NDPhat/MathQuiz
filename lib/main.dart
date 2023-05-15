import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:device_preview/device_preview.dart';
import 'application/di/setupProject.dart';

GetIt instance = GetIt.instance;

void main() {
  setUpProject();

  runApp(DevicePreview(
    builder: (context) => const MathQuizApp(), // Wrap your app
  ));
}

class MathQuizApp extends StatelessWidget {
  const MathQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        // Hides Status bar and shows Navigation bar
        SystemUiOverlay.bottom,
      ],
    );
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return const MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.welcome,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
