import 'package:trusttunnel/common/controller/concurrency/sequential_controller_handler.dart';
import 'package:trusttunnel/common/controller/controller/state_controller.dart';
import 'package:trusttunnel/common/error/exception_utils.dart';
import 'package:trusttunnel/common/theme/theme_mode_type.dart';
import 'package:trusttunnel/data/repository/theme_settings_repository.dart';
import 'package:trusttunnel/feature/settings/theme/controller/theme_mode_state.dart';

final class ThemeModeController extends BaseStateController<ThemeModeState> with SequentialControllerHandler {
  final ThemeSettingsRepository _repository;

  ThemeModeController({
    required this._repository,
    super.initialState = const ThemeModeState.initial(),
  });

  void fetch() => handle(
    () async {
      setState(
        ThemeModeState.loading(
          themeMode: state.themeMode,
        ),
      );

      final themeMode = await _repository.getThemeMode();

      setState(
        ThemeModeState.idle(
          themeMode: themeMode,
        ),
      );
    },
    errorHandler: _onError,
    completionHandler: _onCompleted,
  );

  void setThemeMode(ThemeModeType themeMode) => handle(
    () async {
      setState(
        ThemeModeState.loading(
          themeMode: state.themeMode,
        ),
      );

      await _repository.setThemeMode(themeMode);

      setState(
        ThemeModeState.idle(
          themeMode: themeMode,
        ),
      );
    },
    errorHandler: _onError,
    completionHandler: _onCompleted,
  );

  void _onError(Object? error, StackTrace? stackTrace) => setState(
    ThemeModeState.error(
      themeMode: state.themeMode,
      error: ExceptionUtils.toPresentationException(exception: error),
    ),
  );

  void _onCompleted() => setState(
    ThemeModeState.idle(
      themeMode: state.themeMode,
    ),
  );
}
