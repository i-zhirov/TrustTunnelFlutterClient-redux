import 'package:trusttunnel/common/error/model/presentation_exception.dart';
import 'package:trusttunnel/common/theme/theme_mode_type.dart';

sealed class ThemeModeState {
  final ThemeModeType themeMode;

  const ThemeModeState({
    required this.themeMode,
  });

  const factory ThemeModeState.initial() = _ThemeModeInitialState;

  const factory ThemeModeState.idle({
    required ThemeModeType themeMode,
  }) = _ThemeModeIdleState;

  const factory ThemeModeState.loading({
    required ThemeModeType themeMode,
  }) = _ThemeModeLoadingState;

  const factory ThemeModeState.error({
    required ThemeModeType themeMode,
    required PresentationException error,
  }) = _ThemeModeErrorState;

  PresentationException? get error => switch (this) {
    _ThemeModeErrorState(:final error) => error,
    _ => null,
  };

  bool get loading => this is _ThemeModeLoadingState;

  bool get initial => this is _ThemeModeInitialState;

  @override
  int get hashCode => Object.hash(
    themeMode,
    error,
    loading,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModeState &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode &&
          error == other.error &&
          loading == other.loading;

  @override
  String toString() => 'ThemeModeState(type: $runtimeType, themeMode: $themeMode, loading: $loading)';
}

final class _ThemeModeInitialState extends _ThemeModeIdleState {
  const _ThemeModeInitialState()
    : super(
        themeMode: ThemeModeType.system,
      );
}

final class _ThemeModeIdleState extends ThemeModeState {
  const _ThemeModeIdleState({
    required super.themeMode,
  });
}

final class _ThemeModeLoadingState extends ThemeModeState {
  const _ThemeModeLoadingState({
    required super.themeMode,
  });
}

final class _ThemeModeErrorState extends ThemeModeState {
  @override
  final PresentationException error;

  const _ThemeModeErrorState({
    required super.themeMode,
    required this.error,
  });
}
