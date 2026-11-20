import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trusttunnel/feature/app/widgets/app_custom_macos_title_bar.dart';
import 'package:trusttunnel/feature/app/widgets/app_custom_windows_title_bar.dart';

class AppSystemUIShell extends StatefulWidget {
  final Widget child;

  const AppSystemUIShell({
    required this.child,
    super.key,
  });

  @override
  State<AppSystemUIShell> createState() => _AppSystemUIShellState();
}

class _AppSystemUIShellState extends State<AppSystemUIShell> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Keep the platform status bar icons in sync with the active theme
    // (light or dark).
    final systemOverlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;
    if (systemOverlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(systemOverlayStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.macOS && defaultTargetPlatform != TargetPlatform.windows) {
      return widget.child;
    }

    return Column(
      children: [
        if (defaultTargetPlatform == TargetPlatform.windows)
          const AppCustomWindowsTitleBar()
        else
          const AppCustomMacOSTitleBar(),
        Expanded(
          child: widget.child,
        ),
      ],
    );
  }
}
