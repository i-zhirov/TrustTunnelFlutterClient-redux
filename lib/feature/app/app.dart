import 'package:flutter/material.dart';
import 'package:trusttunnel/common/constants/app_constants.dart';
import 'package:trusttunnel/common/extensions/context_extensions.dart';
import 'package:trusttunnel/common/localization/localization.dart';
import 'package:trusttunnel/common/logging/observers/logging_navigator_observer.dart';
import 'package:trusttunnel/feature/app/widgets/app_system_ui_shell.dart';
import 'package:trusttunnel/feature/navigation/navigation_screen.dart';
import 'package:trusttunnel/feature/settings/theme/widgets/scope/theme_mode_scope.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final themeModeScope = ThemeModeScope.controllerOf(context);

    return MaterialApp(
      theme: context.dependencyFactory.lightThemeData,
      darkTheme: context.dependencyFactory.darkThemeData,
      themeMode: themeModeScope.themeMode.toThemeMode(),
      navigatorObservers: [
        LoggingNavigatorObserver(
          navigatorName: 'root',
        ),
      ],
      home: const AppSystemUIShell(
        child: NavigationScreen(),
      ),
      title: AppConstants.appName,
      locale: Localization.defaultLocale,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
    );
  }
}
