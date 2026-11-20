import 'package:flutter/widgets.dart';
import 'package:trusttunnel/common/controller/widget/state_consumer.dart';
import 'package:trusttunnel/common/extensions/context_extensions.dart';
import 'package:trusttunnel/common/theme/theme_mode_type.dart';
import 'package:trusttunnel/feature/settings/theme/controller/theme_mode_controller.dart';
import 'package:trusttunnel/feature/settings/theme/controller/theme_mode_state.dart';
import 'package:trusttunnel/feature/settings/theme/widgets/scope/theme_mode_scope_aspect.dart';
import 'package:trusttunnel/feature/settings/theme/widgets/scope/theme_mode_scope_controller.dart';

/// Provides the selected [ThemeModeType] to the widget tree.
///
/// This scope should be placed above [MaterialApp] so the app can switch
/// its theme in response to the persisted setting.
class ThemeModeScope extends StatefulWidget {
  final Widget child;

  const ThemeModeScope({
    required this.child,
    super.key,
  });

  /// Get the controller from context.
  static ThemeModeScopeController controllerOf(
    BuildContext context, {
    bool listen = true,
    ThemeModeScopeAspect? aspect,
  }) => _InheritedThemeModeScope.controllerOf(context, listen: listen, aspect: aspect);

  @override
  State<ThemeModeScope> createState() => _ThemeModeScopeState();
}

class _ThemeModeScopeState extends State<ThemeModeScope> {
  late final ThemeModeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ThemeModeController(
      repository: context.repositoryFactory.themeSettingsRepository,
    );
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) => StateConsumer<ThemeModeController, ThemeModeState>(
    controller: _controller,
    builder: (context, state, _) => _InheritedThemeModeScope(
      loading: state.loading,
      themeMode: state.themeMode,
      setThemeMode: _controller.setThemeMode,
      child: widget.child,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _InheritedThemeModeScope extends InheritedModel<ThemeModeScopeAspect> implements ThemeModeScopeController {
  const _InheritedThemeModeScope({
    required super.child,
    required this.loading,
    required this.themeMode,
    required this.setThemeMode,
  });

  @override
  final bool loading;

  @override
  final ThemeModeType themeMode;

  @override
  final void Function(ThemeModeType themeMode) setThemeMode;

  @override
  bool updateShouldNotify(_InheritedThemeModeScope oldWidget) =>
      loading != oldWidget.loading || themeMode != oldWidget.themeMode || setThemeMode != oldWidget.setThemeMode;

  @override
  bool updateShouldNotifyDependent(
    covariant _InheritedThemeModeScope oldWidget,
    Set<ThemeModeScopeAspect> dependencies,
  ) {
    if (dependencies.isEmpty) return updateShouldNotify(oldWidget);

    return dependencies.contains(ThemeModeScopeAspect.themeMode) &&
        (themeMode != oldWidget.themeMode || setThemeMode != oldWidget.setThemeMode);
  }

  static _InheritedThemeModeScope controllerOf(
    BuildContext context, {
    bool listen = true,
    ThemeModeScopeAspect? aspect,
  }) => _inheritFrom(context, listen: listen, aspect: aspect) ?? _notFoundInheritedWidgetOfExactType();

  static _InheritedThemeModeScope? _inheritFrom(
    BuildContext context, {
    bool listen = true,
    ThemeModeScopeAspect? aspect,
  }) => (listen
      ? InheritedModel.inheritFrom<_InheritedThemeModeScope>(
          context,
          aspect: aspect,
        )
      : context.getElementForInheritedWidgetOfExactType<_InheritedThemeModeScope>()?.widget
            as _InheritedThemeModeScope?);

  static Never _notFoundInheritedWidgetOfExactType<T extends InheritedModel<ThemeModeScopeAspect>>() =>
      throw ArgumentError(
        'Inherited widget out of scope and not found of $T exact type',
        'out_of_scope',
      );
}
