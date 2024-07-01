import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_navigator_builder.dart';

/// {@template TnNavigatorBuilder}
/// Widget for TnNavigator builder
/// {@endtemplate}
class TnNavigatorBuilder extends StatefulWidget {
  /// {@template initialPath}
  /// Initial path for navigation
  /// {@endtemplate}
  final String initialPath;

  /// {@template params}
  /// params for initial path
  /// {@endtemplate}
  final Map<String, dynamic>? params;

  const TnNavigatorBuilder({
    super.key,
    required this.initialPath,
    this.params,
  });

  @override
  State<TnNavigatorBuilder> createState() => _TnNavigatorBuilderState();
}

class _TnNavigatorBuilderState extends State<TnNavigatorBuilder> {
  /// {@template router}
  /// TnRouter instance
  /// {@endtemplate}
  final router = TnRouter();

  /// {@template initState}
  /// Initialize TnRouter and navigates to initialPath
  /// {@endtemplate}
  @override
  void initState() {
    router
      ..initialize()
      ..go(
        widget.initialPath,
        params: widget.params,
        context: context,
      );
    super.initState();
  }

  /// {@template dispose}
  /// Disposal for TnRouter Stream
  /// {@endtemplate}
  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const TnBottomSheetNavigatorBuilder();
  }
}
