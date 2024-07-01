import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_navigator_builder.dart';

class TnNavigatorBuilder extends StatefulWidget {
  final String initialPath;
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
  final router = TnRouter();

  @override
  void initState() {
    router
      ..initialize()
      ..go(widget.initialPath, params: widget.params, context: context);
    super.initState();
  }

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
