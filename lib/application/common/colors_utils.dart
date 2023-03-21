import 'dart:math' as math;
import 'package:flutter/material.dart';

Color createRandomColor() {
  final random = math.Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

Color createRandomColorFrom(Color color) {
  int range = 50;
  final random = math.Random();

  int modifyColor(int componente) {
    int min = math.max(0, componente - range);
    int maxValor = math.min(255, componente + range);
    return min + random.nextInt(maxValor - min);
  }

  return Color.fromARGB(
    color.alpha,
    modifyColor(color.red),
    modifyColor(color.green),
    modifyColor(color.blue),
  );
}
