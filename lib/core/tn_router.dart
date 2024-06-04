import 'dart:async';

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
  final List<TnBottomSheetRoute> _stack = [];

  /// {@template tn_router_stream_controller}
  /// Private stream controller to emit events and publish the route to be rendered
  /// {@endtemplate}
  StreamController<TnBottomSheetRoute?> _controller = StreamController();

  /// {@template tn_router_opened_control}
  /// Private bool to handle the opened status
  /// {@endtemplate}
  bool _isOpened = false;

  static final TnRouter instance = TnRouter._internal();

  TnRouter._internal();

  factory TnRouter() {
    return instance;
  }

  void setRoutes(List<TnBottomSheetRoute> routes) {
    print(routes);
    _routes = routes;
  }

  Stream<TnBottomSheetRoute?> get stream => _controller.stream;
  bool get canPop => count > 1;
  bool get isOpened => _isOpened;
  int get count => _stack.length;
  TnBottomSheetRoute? get lastRoute => _stack.last;

  void initialize() {
    _controller = StreamController();
    _isOpened = true;
  }

  void go(
    String path, {
    Map<String, dynamic>? params,
  }) {
    clear();
    push(path, params: params);
  }

  void push(
    String path, {
    Map<String, dynamic>? params,
  }) {
    final route = _routes.where((r) => r.path == path).firstOrNull;
    if (route != null) {
      final routeWithParams = route.copyWith(params: params);
      _stack.add(routeWithParams);
      _controller.add(routeWithParams);
    }
  }

  void pop() {
    if (_stack.isNotEmpty) {
      _stack.removeLast();
      _controller.add(_stack.lastOrNull);
    }
  }

  void clear() {
    _stack.clear();
  }

  void dispose() {
    clear();
    _isOpened = false;
    _controller.close();
  }
}
