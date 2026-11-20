import 'package:shared_preferences/shared_preferences.dart';
import 'package:trusttunnel/common/theme/theme_mode_type.dart';
import 'package:trusttunnel/data/datasources/theme_settings_datasource.dart';

/// {@template theme_settings_data_source_impl}
/// SharedPreferences-backed implementation of [ThemeSettingsDataSource].
/// {@endtemplate}
class ThemeSettingsDataSourceImpl implements ThemeSettingsDataSource {
  static const _themeModeKey = 'theme_mode';

  final SharedPreferences _preferences;

  ThemeSettingsDataSourceImpl({
    required this._preferences,
  });

  /// {@macro theme_settings_data_source_get_theme_mode}
  @override
  Future<ThemeModeType> getThemeMode() async => ThemeModeType.parse(
    _preferences.getString(_themeModeKey),
  );

  /// {@macro theme_settings_data_source_set_theme_mode}
  @override
  Future<void> setThemeMode(ThemeModeType themeMode) => _preferences.setString(_themeModeKey, themeMode.value);
}
