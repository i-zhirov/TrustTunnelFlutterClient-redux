import 'package:flutter/material.dart';

/// Application theme mode selection.
///
/// Mirrors Flutter's [ThemeMode] but is designed for persistence:
/// values are stored as strings.
enum ThemeModeType {
  system('system'),
  light('light'),
  dark('dark');

  final String value;

  const ThemeModeType(this.value);

  /// Parses a stored [value] back into a [ThemeModeType].
  ///
  /// Unknown values fall back to [ThemeModeType.system].
  static ThemeModeType parse(String? value) => ThemeModeType.values.firstWhere(
    (type) => type.value == value,
    orElse: () => ThemeModeType.system,
  );

  /// Converts this selection into Flutter's [ThemeMode].
  ThemeMode toThemeMode() => switch (this) {
    ThemeModeType.system => ThemeMode.system,
    ThemeModeType.light => ThemeMode.light,
    ThemeModeType.dark => ThemeMode.dark,
  };
}
