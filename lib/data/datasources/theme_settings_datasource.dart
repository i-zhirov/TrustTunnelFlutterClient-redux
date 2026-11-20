import 'package:trusttunnel/common/theme/theme_mode_type.dart';

/// Persistence interface for the app theme mode setting.
abstract class ThemeSettingsDataSource {
  /// Persists the selected [themeMode].
  Future<void> setThemeMode(ThemeModeType themeMode);

  /// Loads the currently stored theme mode.
  Future<ThemeModeType> getThemeMode();
}
