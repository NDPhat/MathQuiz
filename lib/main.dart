import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:math/routers/navigation.dart';

GetIt instance = GetIt.instance;

void main() {
  runApp(const MathQuizApp());
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
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.welcome,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
