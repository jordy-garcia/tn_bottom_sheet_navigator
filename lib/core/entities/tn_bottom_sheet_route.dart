import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// {@template TnBottomSheetRoute}
/// A base entity to create bottom sheet routes
///
/// ```dart
/// TnBottomSheetRoute(
///   path: 'home',
///   builder: (context, params) =>
///     const HomePage(),
/// )
/// ```
/// {@endtemplate}
class TnBottomSheetRoute extends Equatable {
  /// {@template route_path}
  /// The path of the route
  /// {@endtemplate}
  final String path;

  /// {@template route_builder}
  /// The builder method to create the widget
  /// {@endtemplate}
  final Widget Function(BuildContext context, Map<String, dynamic> params)
      builder;

  /// {@template route_params}
  /// The params for the route, this is most used while navigation
  /// {@endtemplate}
  final Map<String, dynamic> params;

  /// {@template route_constructor}
  /// The constructor for the route
  /// The params will always be initiated as empty map and filled on navigation flow
  /// {@endtemplate}
  const TnBottomSheetRoute({
    required this.path,
    required this.builder,
    this.params = const {},
  });

  /// {@template route_copier}
  /// A copy helper method to update the params used on the route
  /// {@endtemplate}
  TnBottomSheetRoute copyWith({Map<String, dynamic>? params}) =>
      TnBottomSheetRoute(
        builder: builder,
        path: path,
        params: params ?? this.params,
      );

  @override
  List<Object?> get props => [
        path,
        builder,
        params,
      ];
}
