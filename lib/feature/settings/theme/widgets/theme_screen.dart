import 'package:flutter/material.dart';
import 'package:trusttunnel/common/extensions/context_extensions.dart';
import 'package:trusttunnel/common/localization/localization.dart';
import 'package:trusttunnel/common/theme/theme_mode_type.dart';
import 'package:trusttunnel/feature/settings/theme/widgets/scope/theme_mode_scope.dart';
import 'package:trusttunnel/feature/settings/theme/widgets/scope/theme_mode_scope_controller.dart';
import 'package:trusttunnel/widgets/common/custom_radio_list_tile.dart';
import 'package:trusttunnel/widgets/custom_app_bar.dart';
import 'package:trusttunnel/widgets/scaffold_wrapper.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWrapper(
    child: Scaffold(
      appBar: CustomAppBar(
        title: context.ln.appearance,
        centerTitle: true,
        leadingIconType: AppBarLeadingIconType.back,
      ),
      body: const ThemeBody(),
    ),
  );
}

class ThemeBody extends StatefulWidget {
  const ThemeBody({super.key});

  @override
  State<ThemeBody> createState() => _ThemeBodyState();
}

class _ThemeBodyState extends State<ThemeBody> {
  late ThemeModeScopeController _controller;
  late ThemeModeType _themeMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = ThemeModeScope.controllerOf(context);
    _themeMode = _controller.themeMode;
  }

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(context.ln.appearance, style: context.textTheme.bodyLarge),
      ),
      CustomRadioListTile<ThemeModeType>(
        value: ThemeModeType.system,
        groupValue: _themeMode,
        onChanged: _setThemeMode,
        title: context.ln.themeModeSystem,
        subTitle: context.ln.themeModeSystemDescription,
        radioColor: context.colors.neutralBlack,
      ),
      CustomRadioListTile<ThemeModeType>(
        value: ThemeModeType.light,
        groupValue: _themeMode,
        onChanged: _setThemeMode,
        title: context.ln.themeModeLight,
        subTitle: context.ln.themeModeLightDescription,
        radioColor: context.colors.neutralBlack,
      ),
      CustomRadioListTile<ThemeModeType>(
        value: ThemeModeType.dark,
        groupValue: _themeMode,
        onChanged: _setThemeMode,
        title: context.ln.themeModeDark,
        subTitle: context.ln.themeModeDarkDescription,
        radioColor: context.colors.neutralBlack,
      ),
    ],
  );

  void _setThemeMode(ThemeModeType? value) {
    if (value != null && value != _themeMode) {
      _controller.setThemeMode(value);
    }
  }
}
