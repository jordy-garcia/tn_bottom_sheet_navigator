import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

void main() {
  group('TnBottomSheetAppBarTheme', () {
    test('it has some properties by default', () {
      const sut = TnBottomSheetAppBarTheme();

      expect(sut.closeIconSize, isA<num>());
      expect(sut.padding, isA<EdgeInsets>());
      expect(sut.titleTextStyle, isA<TextStyle>());
    });

    test('copyWith returns a copy of default with modified props', () {
      const baseTheme = TnBottomSheetAppBarTheme();
      final sut = const TnBottomSheetAppBarTheme().copyWith(
        closeIconSize: 40,
      );
      expect(sut.padding, baseTheme.padding);
      expect(sut.closeIconSize, 40);
      expect(sut.titleTextStyle, baseTheme.titleTextStyle);
      expect(sut != baseTheme, true);
    });

    test('copyWith returns a default theme if no props passed', () {
      const baseTheme = TnBottomSheetAppBarTheme();
      final sut = const TnBottomSheetAppBarTheme().copyWith();
      expect(sut.padding, baseTheme.padding);
      expect(sut.closeIconSize, baseTheme.closeIconSize);
      expect(sut.titleTextStyle, baseTheme.titleTextStyle);
      expect(sut == baseTheme, true);
    });
  });
}
