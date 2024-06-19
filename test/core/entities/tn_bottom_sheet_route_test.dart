import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_route.dart';

void main() {
  group('TnBottomSheetRoute', () {
    test('copyWith method updates params object', () {
      final route = TnBottomSheetRoute(
        path: 'test',
        builder: (_, __) => Container(),
      );
      final copy = route.copyWith(params: {'test': 'test'});
      expect(route != copy, true);
      expect(route.params != copy.params, true);
    });

    test('copyWith with no props returns base object', () {
      final route = TnBottomSheetRoute(
        path: 'test',
        builder: (_, __) => Container(),
      );
      final copy = route.copyWith();
      expect(route == copy, true);
    });
  });
}
