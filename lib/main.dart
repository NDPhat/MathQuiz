import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/screen/game_screen/game_screen.dart';
import 'package:math/screen/welcome_screen.dart';

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
