import 'package:color_quest/application/common/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameNotifier extends ChangeNotifier {
  List<Color> colors = [];

  int points = 0;
  int lives = 3;

  Duration time = const Duration(seconds: 10);

  void buildColors() {
    final baseColor = createRandomColor();

    final userColor = createRandomColorFrom(baseColor);

    colors = [
      baseColor,
      userColor,
    ];

    notifyListeners();
  }

  void changeColor(Color color) {
    colors[1] = color;
    notifyListeners();
  }

  bool calculateSimilitude(int time) {
    if (lives <= 0) return false;

    final baseColor = colors[0];
    final userColor = colors[1];

    final baseHSL = HSLColor.fromColor(baseColor);
    final userHSL = HSLColor.fromColor(userColor);

    final baseHue = baseHSL.hue;
    final userHue = userHSL.hue;

    final baseLightness = baseHSL.lightness;
    final userLightness = userHSL.lightness;

    final hueDiff = (baseHue - userHue).abs();
    final lightnessDiff = (baseLightness - userLightness).abs();

    final hueDiffPercent = hueDiff / 360;
    final lightnessDiffPercent = lightnessDiff / 1;

    final totalDiff = hueDiffPercent + lightnessDiffPercent;

    final totalDiffPercent = totalDiff / 2;

    if (totalDiffPercent < 0.5) {
      return false;
    }
    final pointsToAdd = (totalDiffPercent * (time * 10)).round();
    points += pointsToAdd;
    notifyListeners();
    return true;
  }

  void removeLive() {
    lives--;
    notifyListeners();
  }
}

final gameProvider = ChangeNotifierProvider.autoDispose<GameNotifier>((ref) {
  return GameNotifier();
});
