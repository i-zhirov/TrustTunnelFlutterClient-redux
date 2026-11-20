import 'package:trusttunnel/common/theme/theme_mode_type.dart';
import 'package:trusttunnel/data/datasources/theme_settings_datasource.dart';

abstract class ThemeSettingsRepository {
  Future<void> setThemeMode(ThemeModeType themeMode);

  Future<ThemeModeType> getThemeMode();
}

class ThemeSettingsRepositoryImpl implements ThemeSettingsRepository {
  final ThemeSettingsDataSource _dataSource;

  ThemeSettingsRepositoryImpl({
    required ThemeSettingsDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<ThemeModeType> getThemeMode() => _dataSource.getThemeMode();

  @override
  Future<void> setThemeMode(ThemeModeType themeMode) => _dataSource.setThemeMode(themeMode);
}
