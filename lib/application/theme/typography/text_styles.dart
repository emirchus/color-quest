import 'package:color_quest/application/theme/colors.dart';
import 'package:color_quest/application/theme/typography/typography.dart';
import 'package:flutter/widgets.dart';

/// ColorQuest Text Style Definitions
class ColorQuestTextStyle {
  static const _baseTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: ColorQuestColors.white,
    fontWeight: ColorQuestFontWeight.regular,
  );

  static TextStyle get displayLarge {
    return _baseTextStyle.copyWith(
      fontSize: 57,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get displayMedium {
    return _baseTextStyle.copyWith(
      fontSize: 45,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get displaySmall {
    return _baseTextStyle.copyWith(
      fontSize: 36,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get headlineLarge {
    return _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: ColorQuestFontWeight.medium,
    );
  }

  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: ColorQuestFontWeight.medium,
    );
  }

  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: ColorQuestFontWeight.medium,
    );
  }

  static TextStyle get labelMedium {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: ColorQuestFontWeight.medium,
    );
  }

  static TextStyle get labelSmall {
    return _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: ColorQuestFontWeight.medium,
    );
  }

  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }

  static TextStyle get bodySmall {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: ColorQuestFontWeight.regular,
    );
  }
}
