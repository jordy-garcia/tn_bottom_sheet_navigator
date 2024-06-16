import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// {@template TnBottomSheetAppBarTheme}
/// Creates a TnBottomSheetAppBarTheme
/// {@endtemplate}
class TnBottomSheetAppBarTheme extends Equatable {
  /// {@template TnBottomSheetAppBarTheme_closeIconSize}
  /// Controls the closeIcon size
  /// {@endtemplate}
  final double closeIconSize;

  /// {@template TnBottomSheetAppBarTheme_titleTextStyle}
  /// Controls the String title TextStyle
  /// {@endtemplate}
  final TextStyle titleTextStyle;

  /// {@template TnBottomSheetAppBarTheme_padding}
  /// Controls the TnBottomSheetAppBar padding
  /// {@endtemplate}
  final EdgeInsets padding;

  const TnBottomSheetAppBarTheme({
    this.closeIconSize = 24,
    this.titleTextStyle = const TextStyle(
      fontSize: 18,
    ),
    this.padding = const EdgeInsets.all(10.0),
  });

  /// {@template TnBottomSheetAppBarTheme_copyWith}
  /// Creates a TnBottomSheetAppBarTheme copy with changes
  ///
  /// if a prop is not passed it will use the prop from the source
  /// you'd be making the copy
  /// {@endtemplate}
  TnBottomSheetAppBarTheme copyWith({
    double? closeIconSize,
    TextStyle? titleTextStyle,
    EdgeInsets? padding,
  }) =>
      TnBottomSheetAppBarTheme(
        closeIconSize: closeIconSize ?? this.closeIconSize,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        padding: padding ?? this.padding,
      );

  @override
  List<Object?> get props => [
        closeIconSize,
        titleTextStyle,
        padding,
      ];
}
