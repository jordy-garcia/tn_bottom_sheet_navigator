import 'package:flutter/material.dart';

/// {@template TnBottomSheetSettings}
/// A base entity for bottom sheet navigator settings
///
/// ```dart
/// TnBottomSheetSettings(
///   isDismissable: true,
///   isScrollControlled: true,
///   useRootNavigator: false,
///   constraints: BoxConstraints(
///     maxHeight: 200,
///   ),
/// )
/// ```
///
/// {@endtemplate}
class TnBottomSheetSettings {
  /// {@template settings_dismisable}
  /// A bool to control if the bottom sheet navigator can be dismissable or not
  /// {@endtemplate}
  final bool isDismisable;

  /// {@template settings_scroll_controlled}
  /// A bool to control if the bottom sheet navigator has dynamic height and allow scroll
  /// {@endtemplate}
  final bool isScrollControlled;

  /// {@template settings_root_navigator}
  /// A bool to control if the bottom sheet navigator should use root navigator
  /// {@endtemplate}
  final bool useRootNavigator;

  /// {@template settings_constraints}
  /// The box constraints for the modal bottom sheet, this will help to control max height for example.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template settings}
  /// The constructor for the navigator settings
  /// It has default settings for bool variables
  /// {@endtemplate}
  const TnBottomSheetSettings({
    this.isDismisable = false,
    this.isScrollControlled = true,
    this.useRootNavigator = true,
    this.constraints,
  });
}
