import 'package:color_quest/application/theme/data/theme_data.dart';
import 'package:color_quest/presentation/presentation.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Color Quest",
      theme: ColorQuestTheme().darkTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/game": (context) => const ColorScreen(),
      },
    );
  }
}
