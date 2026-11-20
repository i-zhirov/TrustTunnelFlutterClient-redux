import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trusttunnel/common/assets/asset_icons.dart';
import 'package:trusttunnel/common/assets/font_families.dart';
import 'package:trusttunnel/common/extensions/theme_extensions.dart';
import 'package:trusttunnel/widgets/custom_icon.dart';

abstract class AppTheme {
  Brightness get brightness;
  Color get accent;
  Color get accentHover;
  Color get accentPressed;
  Color get accentDisabled;
  Color get blend;
  Color get blendHover;
  Color get blendPressed;
  Color get attention;
  Color get attentionHover;
  Color get attentionPressed;
  Color get attentionDisabled;
  Color get error;
  Color get errorHover;
  Color get errorPressed;
  Color get errorDisabled;
  Color get background;
  Color get backgroundAdditional;
  Color get backgroundElevated;
  Color get backgroundSystem;
  Color get backgroundSystemHover;
  Color get backgroundSystemPressed;
  Color get neutralLight;
  Color get neutralLightHover;
  Color get neutralLightPressed;
  Color get neutralLightDisabled;
  Color get neutralBlack;
  Color get neutralBlackHover;
  Color get neutralBlackPressed;
  Color get neutralBlackDisabled;
  Color get neutralDark;
  Color get neutralDarkHover;
  Color get neutralDarkPressed;
  Color get neutralDarkDisabled;
  Color get specialStaticWhite;
  Color get specialStaticWhiteHover;
  Color get specialStaticWhitePressed;
  Color get specialStaticWhiteDisabled;
  Color get staticTransparent;
  Color get appSystemTitleBarBackground;
  Color get appSystemTitleBarTitle;
  Color get primary1;
  Color get primary2;
  Color get primary3;
  Color get primary4;
  Color get blend1;
  Color get blend2;
  Color get blend3;
  Color get orange1;
  Color get orange2;
  Color get orange3;
  Color get orange4;
  Color get red1;
  Color get red2;
  Color get red3;
  Color get red4;
  Color get background1;
  Color get background2;
  Color get background3;
  Color get gray1;
  Color get gray2;
  Color get gray3;
  Color get gray4;
  Color get contrast1;
  Color get contrast2;
  Color get contrast3;
  Color get contrast4;
  Color get staticBlack1;
  Color get staticBlack2;
  Color get staticBlack3;
  Color get staticWhite;
  Color get purple1;
  Color get purple2;
  Color get purple3;
  Color get purple4;
  Color get accentMainDefault;

  Color get neutralBlend;

  Color get dumInputDecorationIdleColor;

  /// Background of floating snack bars.
  ///
  /// Stays dark in both themes so that light snack bar text remains readable.
  Color get snackBarBackground;

  Color get accentAdditional;

  Color get backgroundHover;

  Color get backgroundPressed;

  late final _customColors = CustomColors(
    accent: accent,
    accentHover: accentHover,
    accentPressed: accentPressed,
    accentDisabled: accentDisabled,
    blend: blend,
    blendHover: blendHover,
    blendPressed: blendPressed,
    attention: attention,
    attentionHover: attentionHover,
    attentionPressed: attentionPressed,
    attentionDisabled: attentionDisabled,
    error: error,
    errorHover: errorHover,
    errorPressed: errorPressed,
    errorDisabled: errorDisabled,
    background: background,
    backgroundAdditional: backgroundAdditional,
    backgroundElevated: backgroundElevated,
    backgroundSystem: backgroundSystem,
    backgroundSystemHover: backgroundSystemHover,
    backgroundSystemPressed: backgroundSystemPressed,
    neutralLight: neutralLight,
    neutralLightHover: neutralLightHover,
    neutralLightPressed: neutralLightPressed,
    neutralLightDisabled: neutralLightDisabled,
    neutralBlack: neutralBlack,
    neutralBlackHover: neutralBlackHover,
    neutralBlackPressed: neutralBlackPressed,
    neutralBlackDisabled: neutralBlackDisabled,
    neutralDark: neutralDark,
    neutralDarkHover: neutralDarkHover,
    neutralDarkPressed: neutralDarkPressed,
    neutralDarkDisabled: neutralDarkDisabled,
    specialStaticWhite: specialStaticWhite,
    specialStaticWhiteHover: specialStaticWhiteHover,
    specialStaticWhitePressed: specialStaticWhitePressed,
    specialStaticWhiteDisabled: specialStaticWhiteDisabled,
    staticTransparent: staticTransparent,
    appSystemTitleBarBackground: appSystemTitleBarBackground,
    appSystemTitleBarTitle: appSystemTitleBarTitle,
    primary1: primary1,
    primary2: primary2,
    primary3: primary3,
    primary4: primary4,
    blend1: blend1,
    blend2: blend2,
    blend3: blend3,
    orange1: orange1,
    orange2: orange2,
    orange3: orange3,
    orange4: orange4,
    red1: red1,
    red2: red2,
    red3: red3,
    red4: red4,
    background1: background1,
    background2: background2,
    background3: background3,
    gray1: gray1,
    gray2: gray2,
    gray3: gray3,
    gray4: gray4,
    contrast1: contrast1,
    contrast2: contrast2,
    contrast3: contrast3,
    contrast4: contrast4,
    staticBlack1: staticBlack1,
    staticBlack2: staticBlack2,
    staticBlack3: staticBlack3,
    staticWhite: staticWhite,
    purple1: purple1,
    purple2: purple2,
    purple3: purple3,
    purple4: purple4,
    accentMainDefault: accentMainDefault,
  );

  late final _colorScheme = ColorScheme.fromSeed(
    seedColor: accent,
    brightness: brightness,
  );

  late final _checkboxThemeData = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected) && !states.contains(WidgetState.disabled)) return accent;
        if (states.contains(WidgetState.selected) && states.contains(WidgetState.disabled)) return accentDisabled;

        return null;
      },
    ),
    checkColor: WidgetStateProperty.all(specialStaticWhite),
    side: WidgetStateBorderSide.resolveWith(
      (states) {
        if (!states.contains(WidgetState.selected) && !states.contains(WidgetState.disabled)) {
          return BorderSide(width: 2, color: neutralLight);
        }
        if (!states.contains(WidgetState.selected) && states.contains(WidgetState.disabled)) {
          return BorderSide(width: 2, color: neutralLightDisabled);
        }

        return null;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.pressed)) return accentPressed.withValues(alpha: 0.2);

        if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return backgroundSystem;

        return staticTransparent;
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
    ),
  );

  late final _iconButtonThemeData = IconButtonThemeData(
    style: ButtonStyle(
      shape: const WidgetStatePropertyAll(
        CircleBorder(),
      ),
      foregroundColor: WidgetStatePropertyAll(
        specialStaticWhite,
      ),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed) || states.contains(WidgetState.focused)) return backgroundHover;
          if (states.contains(WidgetState.hovered)) return backgroundPressed;

          return null;
        },
      ),
      mouseCursor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return SystemMouseCursors.basic;

          return null;
        },
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      iconSize: const WidgetStatePropertyAll(24),
    ),
  );

  late final _radioThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) return neutralBlack.withValues(alpha: 0.38);
        if (states.contains(WidgetState.selected)) return accent;

        return neutralBlack;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused) ||
            states.contains(WidgetState.pressed))
          return backgroundSystem;

        return staticTransparent;
      },
    ),
  );

  late final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: accent,
    extendedTextStyle: _textTheme.labelLarge?.copyWith(color: specialStaticWhite),
    foregroundColor: specialStaticWhite,
    iconSize: 24,
    extendedSizeConstraints: const BoxConstraints(minHeight: 56),
    smallSizeConstraints: const BoxConstraints(minHeight: 40, minWidth: 40),
    sizeConstraints: const BoxConstraints(minHeight: 56, minWidth: 56),
    largeSizeConstraints: const BoxConstraints(minHeight: 96, minWidth: 96),
    focusColor: accentHover,
    hoverColor: accentHover,
    splashColor: accentPressed,
    hoverElevation: 4,
    elevation: 3,
    focusElevation: 3,
    disabledElevation: 3,
    highlightElevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  late final _switchThemeData = SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) return accentMainDefault;

        return background2;
      },
    ),
    thumbColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) return staticWhite;
        if (states.contains(WidgetState.disabled)) return contrast4;

        return contrast1;
      },
    ),
    overlayColor: WidgetStatePropertyAll(staticTransparent),
    trackOutlineWidth: WidgetStateProperty.resolveWith(
      (states) {
        if (!states.contains(WidgetState.selected)) return 2;

        return 0;
      },
    ),
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) return null;

        if (states.contains(WidgetState.disabled)) return gray1;

        return contrast1;
      },
    ),
  );

  late final _snackBarThemeData = SnackBarThemeData(
    backgroundColor: snackBarBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 3,
    contentTextStyle: _textTheme.bodyMedium?.copyWith(color: specialStaticWhite),
    actionTextColor: accentAdditional,
    closeIconColor: specialStaticWhite,
  );

  late final _badgeThemeData = BadgeThemeData(
    textColor: specialStaticWhite,
    textStyle: _textTheme.labelSmall,
    backgroundColor: error,
    smallSize: 6,
    largeSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 4),
  );

  late final _customFilledButtonTheme = CustomFilledButtonTheme(
    danger: FilledButtonThemeData(
      style: _filledButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) return error.withValues(alpha: 0.5);

            return error;
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) return errorPressed;
            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return errorHover;

            return null;
          },
        ),
      ),
    ),
    attention: FilledButtonThemeData(
      style: _filledButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) return attention.withValues(alpha: 0.5);

            return attention;
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) return attentionPressed;
            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return attentionHover;

            return null;
          },
        ),
      ),
    ),
    iconButton: FilledButtonThemeData(
      style: _filledButtonTheme.style?.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 24),
        ),
      ),
    ),
  );

  late final _customElevatedButtonTheme = CustomElevatedButtonTheme(
    iconButton: ElevatedButtonThemeData(
      style: _filledButtonTheme.style?.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 24),
        ),
      ),
    ),
  );

  late final _customOutlinedButtonTheme = CustomOutlinedButtonTheme(
    iconButton: OutlinedButtonThemeData(
      style: _outlinedButtonThemeData.style?.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 24),
        ),
      ),
    ),
  );

  late final _customTextButtonTheme = CustomTextButtonTheme(
    danger: TextButtonThemeData(
      style: _textButtonThemeData.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) return errorDisabled.withValues(alpha: 0.5);

            return error;
          },
        ),
      ),
    ),
    attention: TextButtonThemeData(
      style: _textButtonThemeData.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) return attentionDisabled.withValues(alpha: 0.5);

            return attention;
          },
        ),
      ),
    ),
    success: TextButtonThemeData(
      style: _textButtonThemeData.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) return accentDisabled.withValues(alpha: 0.5);

            return accent;
          },
        ),
      ),
    ),
    iconButton: _textButtonThemeData,
  );

  late final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: _filledButtonTheme.style,
  );

  late final _filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return accentDisabled.withValues(alpha: 0.4);

          return accent;
        },
      ),
      foregroundColor: WidgetStatePropertyAll(specialStaticWhite),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) return accentPressed;
          if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return accentHover;

          return null;
        },
      ),
      textStyle: WidgetStatePropertyAll(_textTheme.labelLarge),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      iconSize: const WidgetStatePropertyAll(18),
      minimumSize: WidgetStatePropertyAll(
        Size(_buttonTheme.minWidth, _buttonTheme.height),
      ),
      visualDensity: VisualDensity.standard,
    ),
  );

  late final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: _filledButtonTheme.style?.copyWith(
      backgroundColor: WidgetStatePropertyAll(staticTransparent),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return neutralLight;

          return neutralBlack;
        },
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) {
          final Color borderColor;

          if (states.contains(WidgetState.disabled)) {
            borderColor = neutralLight;
          } else {
            borderColor = neutralBlack;
          }

          return StadiumBorder(
            side: BorderSide(
              color: borderColor,
            ),
          );
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) return backgroundPressed;
          if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return backgroundHover;

          return null;
        },
      ),
    ),
  );

  late final _textButtonThemeData = TextButtonThemeData(
    style: _filledButtonTheme.style?.copyWith(
      backgroundColor: WidgetStatePropertyAll(staticTransparent),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return neutralLight;

          return neutralBlack;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) return backgroundPressed;
          if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) return backgroundHover;

          return staticTransparent;
        },
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      textStyle: WidgetStatePropertyAll(
        _textTheme.labelLarge,
      ),
    ),
  );

  late final appSystemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: background,
    statusBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    statusBarBrightness: brightness,
    systemStatusBarContrastEnforced: false,
  );

  late final _appBarTheme = AppBarTheme(
    backgroundColor: staticTransparent,
    surfaceTintColor: staticTransparent,
    shadowColor: staticTransparent,
    systemOverlayStyle: appSystemUiOverlayStyle,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: _textTheme.titleLarge,
    centerTitle: true,
    foregroundColor: neutralBlack,
  );

  late final _navigationBarThemeData = NavigationBarThemeData(
    backgroundColor: backgroundSystem,
    indicatorColor: blendHover,
  );

  late final _popupMenuThemeData = PopupMenuThemeData(
    color: background,
    position: PopupMenuPosition.under,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    surfaceTintColor: background,

    elevation: 2,
    textStyle: _textTheme.bodyLarge?.copyWith(
      color: neutralBlack,
    ),
  );

  late final _menuButtonThemeData = MenuButtonThemeData(
    style: _textButtonThemeData.style?.copyWith(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      textStyle: WidgetStatePropertyAll(_textTheme.bodyLarge),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return staticTransparent;
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused) ||
              states.contains(WidgetState.selected))
            return backgroundSystemHover;
          if (states.contains(WidgetState.pressed)) return backgroundSystemPressed;

          return null;
        },
      ),
    ),
  );

  late final _menuBarThemeData = MenuBarThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(background),
      surfaceTintColor: WidgetStatePropertyAll(staticTransparent),
    ),
  );

  late final _dropdownMenuThemeData = DropdownMenuThemeData(
    textStyle: _textTheme.bodyLarge,
    inputDecorationTheme: _inputDecorationTheme,
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(background),
      surfaceTintColor: WidgetStatePropertyAll(staticTransparent),
      visualDensity: VisualDensity.standard,
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 8),
      ),
    ),
  );

  late final _menuThemeData = MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(background),
      surfaceTintColor: WidgetStatePropertyAll(staticTransparent),
    ),
  );

  late final _progressIndicatorThemeData = ProgressIndicatorThemeData(
    color: accent,
    circularTrackColor: blend.withValues(alpha: 0.2),
    linearTrackColor: blend.withValues(alpha: 0.2),
    linearMinHeight: 4,
  );

  late final _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: neutralDarkDisabled.withValues(
          alpha: 0.3,
        ),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: error),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: dumInputDecorationIdleColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: neutralDark,
        width: 3,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: error, width: 3),
    ),
    outlineBorder: BorderSide(
      color: dumInputDecorationIdleColor,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: dumInputDecorationIdleColor,
      ),
    ),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return _textTheme.bodySmall!.copyWith(color: neutralBlackDisabled.withValues(alpha: 0.4));
        }

        if (states.contains(WidgetState.error)) {
          return _textTheme.bodySmall!.copyWith(color: error);
        }

        return _textTheme.bodySmall!;
      },
    ),
    labelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return _textTheme.bodySmall!.copyWith(color: neutralBlackDisabled.withValues(alpha: 0.3));
        }

        if (states.contains(WidgetState.error)) {
          return _textTheme.bodySmall!.copyWith(color: error);
        }

        return _textTheme.bodySmall!;
      },
    ),
    alignLabelWithHint: true,
    hoverColor: backgroundSystem,
    fillColor: staticTransparent,
    iconColor: neutralBlack,
    prefixIconColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralBlackDisabled;
        }

        return neutralBlack;
      },
    ),
    suffixIconColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralBlackDisabled;
        }

        if (states.contains(WidgetState.error)) {
          return error;
        }

        return neutralBlack;
      },
    ),
    errorStyle: _textTheme.bodySmall?.copyWith(color: error),
    hintStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        final Color textColor;
        if (states.contains(WidgetState.disabled)) {
          textColor = neutralDarkDisabled.withValues(alpha: 0.4);
        } else {
          textColor = dumInputDecorationIdleColor;
        }

        return _textTheme.bodyLarge!.copyWith(color: textColor);
      },
    ),
    helperStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return _textTheme.bodySmall!.copyWith(color: neutralBlackDisabled.withValues(alpha: 0.3));
        }

        if (states.contains(WidgetState.error)) {
          return _textTheme.bodySmall!.copyWith(color: error);
        }

        return _textTheme.bodySmall!;
      },
    ),
    counterStyle: WidgetStateTextStyle.resolveWith((states) => _textTheme.bodySmall!),
    contentPadding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusColor: staticTransparent,
  );

  late final _textSelectionTheme = TextSelectionThemeData(
    cursorColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.error)) {
          return error;
        }

        return neutralBlack;
      },
    ),
    selectionColor: blend,
    selectionHandleColor: accent,
  );

  late final _dividerThemeData = DividerThemeData(
    color: neutralBlend,
    space: 1,
  );

  late final _iconThemeData = IconThemeData(
    size: 24,
    color: neutralBlack,
  );

  late final _navigationRailThemeData = NavigationRailThemeData(
    indicatorColor: blend.withValues(alpha: 0.2),
    unselectedLabelTextStyle: _textTheme.labelMedium,
    selectedLabelTextStyle: _textTheme.labelMedium,
    backgroundColor: backgroundSystem,
  );

  late final _actionIconThemeData = ActionIconThemeData(
    closeButtonIconBuilder: (context) => CustomIcon.medium(
      icon: AssetIcons.close,
      color: neutralBlack,
    ),
    backButtonIconBuilder: (context) => CustomIcon.medium(
      icon: AssetIcons.arrowBack,
      color: neutralBlack,
    ),
  );

  late final _listTileThemeData = ListTileThemeData(
    contentPadding: const EdgeInsets.all(16),
    titleTextStyle: _textTheme.titleSmall,
    subtitleTextStyle: _textTheme.bodyMedium?.copyWith(color: neutralLight),
  );

  late final _customDropdownMenuTheme = CustomDropdownMenuTheme(
    enabled: _dropdownMenuThemeData,
    disabled: _dropdownMenuThemeData.copyWith(
      textStyle: _dropdownMenuThemeData.textStyle?.copyWith(
        color: neutralBlackDisabled.withValues(alpha: 0.4),
      ),
    ),
  );

  late final _tabBarTheme = TabBarThemeData(
    labelColor: accent,
    unselectedLabelColor: neutralBlack,
    indicatorColor: accent,
    labelPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    labelStyle: _textTheme.titleSmall,
  );

  late final _dialogTheme = DialogThemeData(
    backgroundColor: background,
    surfaceTintColor: staticTransparent,
    titleTextStyle: _textTheme.headlineSmall,
    contentTextStyle: _textTheme.bodyMedium,
    iconColor: accent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(28.0),
      ),
    ),
  );

  late final _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 57,
      letterSpacing: -0.25,
      height: 1.12,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 45,
      height: 1.15,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 36,
      height: 1.22,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 32,
      height: 1.25,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 28,
      height: 1.28,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 24,
      height: 1.33,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 22,
      height: 1.27,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 16,
      letterSpacing: 0.15,
      height: 1.5,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 14,
      letterSpacing: 0.1,
      height: 1.42,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 14,
      letterSpacing: 0.1,
      height: 1.42,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 12,
      letterSpacing: 0.5,
      height: 1.33,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 11,
      letterSpacing: 0.5,
      height: 1.45,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 16,
      letterSpacing: 0.5,
      height: 1.5,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 14,
      letterSpacing: 0.25,
      height: 1.42,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: neutralBlack,
      fontSize: 12,
      letterSpacing: 0.4,
      height: 1.33,
      fontFamily: FontFamilies.roboto,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );

  final _buttonTheme = const ButtonThemeData(
    minWidth: 70,
    height: 40,
  );

  late final _customFilledIconButtonTheme = CustomFilledIconButtonTheme(
    iconButton: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(specialStaticWhite),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return accent;
            }

            return neutralDark;
          },
        ),
      ),
    ),
    iconButtonInProgress: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(specialStaticWhite),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return accent;
            }

            return neutralDark;
          },
        ),
      ),
    ),
  );

  late final _customMissSpelledTextTheme = CustomMissSpelledTextTheme(
    missSpelledStyle: TextStyle(
      decorationColor: error,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.wavy,
      decorationThickness: 2,
    ),
  );

  ThemeData get data => ThemeData(
    // GENERAL CONFIGURATION
    useMaterial3: true,
    extensions: [
      _customColors,
      _customFilledButtonTheme,
      _customElevatedButtonTheme,
      _customOutlinedButtonTheme,
      _customTextButtonTheme,
      _customDropdownMenuTheme,
      _customFilledIconButtonTheme,
      _customMissSpelledTextTheme,
    ],

    // COLOR
    scaffoldBackgroundColor: background,
    brightness: brightness,
    primaryColor: accent,
    colorScheme: _colorScheme,
    hoverColor: staticTransparent,
    focusColor: staticTransparent,

    // TYPOGRAPHY & ICONOGRAPHY
    textTheme: _textTheme,
    fontFamily: FontFamilies.roboto,
    iconTheme: _iconThemeData,
    textSelectionTheme: _textSelectionTheme,

    // COMPONENT THEMES
    checkboxTheme: _checkboxThemeData,
    iconButtonTheme: _iconButtonThemeData,
    radioTheme: _radioThemeData,
    floatingActionButtonTheme: _floatingActionButtonThemeData,
    switchTheme: _switchThemeData,
    snackBarTheme: _snackBarThemeData,
    badgeTheme: _badgeThemeData,
    elevatedButtonTheme: _elevatedButtonTheme,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonThemeData,
    textButtonTheme: _textButtonThemeData,
    dialogTheme: _dialogTheme,
    menuButtonTheme: _menuButtonThemeData,
    menuBarTheme: _menuBarThemeData,
    dropdownMenuTheme: _dropdownMenuThemeData,
    menuTheme: _menuThemeData,
    popupMenuTheme: _popupMenuThemeData,
    navigationBarTheme: _navigationBarThemeData,
    appBarTheme: _appBarTheme,
    progressIndicatorTheme: _progressIndicatorThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    dividerTheme: _dividerThemeData,
    navigationRailTheme: _navigationRailThemeData,
    actionIconTheme: _actionIconThemeData,
    listTileTheme: _listTileThemeData,
    buttonTheme: _buttonTheme,
    tabBarTheme: _tabBarTheme,
  );
}
