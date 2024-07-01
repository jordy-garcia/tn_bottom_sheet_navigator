import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_settings.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_bottom_sheet_trigger.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';

/// {@template TnContextExtensions}
/// Extensions on build context for shortcut access to TnRouter and TnBottomSheetNavigator
/// {@endtemplate}
extension TnContextExtensions on BuildContext {
  /// {@template tnRouter}
  /// Getter for TnRouter instance (Singleton)
  /// {@endtemplate}
  TnRouter get tnRouter => TnRouter();

  /// {@template tnGo}
  /// Method to go in TnRouter
  /// {@endtemplate}
  void tnGo(
    String path, {
    Map<String, dynamic>? params,
  }) =>
      TnRouter().go(
        path,
        context: this,
        params: params,
      );

  /// {@template tnPush}
  /// Method to push in TnRouter
  /// {@endtemplate}
  void tnPush(
    String path, {
    Map<String, dynamic>? params,
  }) =>
      TnRouter().push(
        path,
        context: this,
        params: params,
      );

  /// {@template tnPop}
  /// Method to pop in TnRouter
  /// {@endtemplate}
  void tnPop() => TnRouter().pop();

  /// {@template showTnBottomSheetNav}
  /// Method to show Bottom Sheet Navigator
  /// {@endtemplate}
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
