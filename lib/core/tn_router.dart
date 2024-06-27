import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_route.dart';

/// {@template TnRouter}
/// The TnRouter Singleton, this holds the navigation flow logic
///
/// ```dart
/// TnRouter()..setRoutes(tnRoutesList)
/// ```
///
/// {@endtemplate}
class TnRouter {
  /// {@template tn_router_routes}
  /// Private list of available routes, this is filled in setRoutes method
  /// {@endtemplate}
  late final List<TnBottomSheetRoute> _routes;

  /// {@template tn_router_navigation_stack}
  /// Private list to hold the navigation stack
  /// {@endtemplate}
  final List<Widget> _stack = [];

  /// {@template tn_router_stream_controller}
  /// Private stream controller to emit events and publish the new stack
  /// {@endtemplate}
  StreamController<List<Widget>> _streamController = StreamController();

  /// {@template tn_router_opened_control}
  /// Private bool to handle the opened status
  /// {@endtemplate}
  bool _isOpened = false;

  static TnRouter _instance = TnRouter._internal();

  @visibleForTesting
  static set instance(TnRouter val) => _instance = val;

  TnRouter._internal();

  factory TnRouter() {
    return _instance;
  }

  /// {@template setRoutes}
  /// Method to initialize the routes
  /// {@endtemplate}
  void setRoutes(List<TnBottomSheetRoute> routes) {
    _routes = routes;
  }

  /// {@template stream}
  /// stream to listen the navigation stack changes
  /// {@endtemplate}
  Stream<List<Widget>> get stream => _streamController.stream;

  /// {@template canPop}
  /// boolean to know if the stack can be pop or not
  /// {@endtemplate}
  bool get canPop => count > 1;

  /// {@template isOpened}
  /// boolean to control if the bottom navigator is opened to avoid overlap
  /// {@endtemplate}
  bool get isOpened => _isOpened;

  /// {@template count}
  /// int to get the amount of routes in the stack
  /// {@endtemplate}
  int get count => _stack.length;

  /// {@template initialize}
  /// Method to initialize the bottom navigator
  /// {@endtemplate}
  void initialize() {
    _streamController = StreamController();
    _isOpened = true;
  }

  /// {@template Go}
  /// Method to clear stack and nav to path
  /// {@endtemplate}
  void go(
    String path, {
    Map<String, dynamic>? params,
    required BuildContext context,
  }) {
    clear();
    push(
      path,
      params: params,
      context: context,
    );
  }

  /// {@template Push}
  /// Method to add new route in the stack
  /// {@endtemplate}
  void push(
    String path, {
    Map<String, dynamic>? params,
    required BuildContext context,
  }) {
    final route = _routes.where((r) => r.path == path).firstOrNull;
    if (route != null) {
      final routeWithParams = route.copyWith(params: params);
      final widget = route.builder(context, routeWithParams.params);
      _stack.add(widget);
      _streamController.add(_stack);
    }
  }

  /// {@template Pop}
  /// Method to nav backward in the navigation stack
  /// {@endtemplate}
  void pop() {
    if (_stack.isNotEmpty) {
      _stack.removeLast();
      _streamController.add(_stack);
    }
  }

  /// {@template Clear}
  /// Method to clear navigation stack
  /// {@endtemplate}
  void clear() {
    _stack.clear();
  }

  /// {@template Dispose}
  /// Method to dispose streams and reset opened variable
  /// {@endtemplate}
  void dispose() {
    clear();
    _isOpened = false;
    _streamController.close();
  }
}
