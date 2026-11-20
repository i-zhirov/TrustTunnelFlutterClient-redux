import 'package:trusttunnel/common/theme/theme_mode_type.dart';

abstract class ThemeModeScopeController {
  abstract final bool loading;

  abstract final ThemeModeType themeMode;

  abstract final void Function(ThemeModeType themeMode) setThemeMode;
}
