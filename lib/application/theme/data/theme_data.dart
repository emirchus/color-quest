import 'package:color_quest/application/theme/theme.dart';
import 'package:flutter/material.dart';

class ColorQuestTheme {
  ColorQuestTheme._();

  factory ColorQuestTheme() => ColorQuestTheme._();

  final ColorScheme darkColorScheme = const ColorScheme.dark(
    primary: Colors.black,
    primaryContainer: Colors.black,
    secondary: Colors.black,
    secondaryContainer: Colors.black,
    surface: Colors.black,
    background: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      primaryIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      typography: Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: darkColorScheme,
      ),
      textTheme: TextTheme(
        displayLarge: ColorQuestTextStyle.displayLarge,
        displayMedium: ColorQuestTextStyle.displayMedium,
        displaySmall: ColorQuestTextStyle.displaySmall,
        headlineLarge: ColorQuestTextStyle.headlineLarge,
        headlineMedium: ColorQuestTextStyle.headlineMedium,
        headlineSmall: ColorQuestTextStyle.headlineSmall,
        titleLarge: ColorQuestTextStyle.titleLarge,
        titleMedium: ColorQuestTextStyle.titleMedium,
        titleSmall: ColorQuestTextStyle.titleSmall,
        labelLarge: ColorQuestTextStyle.labelLarge,
        labelMedium: ColorQuestTextStyle.labelMedium,
        labelSmall: ColorQuestTextStyle.labelSmall,
        bodyLarge: ColorQuestTextStyle.bodyLarge,
        bodyMedium: ColorQuestTextStyle.bodyMedium,
        bodySmall: ColorQuestTextStyle.bodySmall,
      ),
    );
  }
}
