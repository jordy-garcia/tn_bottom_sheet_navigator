import 'package:flutter/material.dart';

class TnBottomSheetSettings {
  final bool isDismisable;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final BoxConstraints? constraints;

  const TnBottomSheetSettings({
    this.isDismisable = false,
    this.isScrollControlled = true,
    this.useRootNavigator = true,
    this.constraints,
  });
}
