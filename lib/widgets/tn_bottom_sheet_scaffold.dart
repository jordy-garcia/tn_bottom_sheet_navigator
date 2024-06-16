import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_appbar.dart';

/// {@template TnBottomSheetScaffold}
/// Creates a TnBottomSheetScaffold
/// {@endtemplate}
class TnBottomSheetScaffold extends StatelessWidget {
  const TnBottomSheetScaffold({
    super.key,
    required this.child,
    required this.appBar,
  });

  /// {@template TnBottomSheetScaffold_child}
  /// Creates a widget that insets its child
  /// {@endtemplate}
  final Widget child;

  /// {@template TnBottomSheetScaffold_appBar}
  /// Creates a TnBottomSheetAppBar
  /// {@endtemplate}
  final TnBottomSheetAppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        appBar,
        child,
      ],
    );
  }
}
