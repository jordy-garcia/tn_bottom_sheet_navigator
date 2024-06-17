import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

void main() {
  group('TnBottomSheetScaffold', () {
    testWidgets('it renders correctly the child passed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TnBottomSheetScaffold(
            appBar: const TnBottomSheetAppBar(),
            child: Container(key: const Key('test_child')),
          ),
        ),
      );

      expect(find.byKey(const Key('test_child')), findsOne);
    });
  });
}
