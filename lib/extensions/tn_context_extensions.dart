import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_settings.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_bottom_sheet_trigger.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';

extension TnContextExtensions on BuildContext {
  TnRouter get tnRouter => TnRouter.instance;

  void showTnBottomSheetNav(
    String initialPath, {
    TnBottomSheetSettings? settings,
  }) =>
      showTnBottomSheetNavigator(
        context: this,
        initialPath: initialPath,
        settings: settings ?? const TnBottomSheetSettings(),
      );
}
