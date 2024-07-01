import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_navigator_builder.dart';

import '../core/tn_bottom_sheet_trigger_test.mocks.dart';
import '../test_utils/mock_data.dart';

void main() {
  final mockRouter = MockTnRouter();

  setUp(() {
    TnRouter.instance = mockRouter;
  });

  group('TnNavigatorBuilder', () {
    testWidgets(
        'It executes the navigator builder and invokes the go method with initialPath',
        (tester) async {
      when(mockRouter.stream)
          .thenAnswer((_) => StreamController<List<Widget>>().stream);
      await tester.pumpWidget(
        const MaterialApp(
          home: TnNavigatorBuilder(initialPath: sampleRoutePath),
        ),
      );
      await tester.pump();
      // Assert
      verify(mockRouter.initialize()).called(1);
      verify(mockRouter.go(sampleRoutePath, context: anyNamed("context")))
          .called(1);
    });
  });
}
