import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

import '../test_utils/mock_data.dart';
import 'tn_bottom_sheet_trigger_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TnRouter>()])
void main() {
  late TnRouter router;

  setUp(() {
    router = TnRouter.instance = MockTnRouter();
  });

  group('showTnBottomSheetNavigator', () {
    testWidgets('it invokes initialize and go methods from router',
        (tester) async {
      late BuildContext testContext;
      // Arrange
      WidgetsFlutterBinding.ensureInitialized();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            testContext = context;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.showTnBottomSheetNav(sampleRoutePath);
            });
            return const SizedBox.shrink();
          }),
        ),
      );
      await tester.pumpAndSettle();
      // Assert
      verify(router.initialize()).called(1);
      verify(router.go(sampleRoutePath, context: testContext)).called(1);
    });

    testWidgets('when is already opened it does not open it again',
        (tester) async {
      late BuildContext testContext;
      // Arrange
      when(router.isOpened).thenReturn(true);
      WidgetsFlutterBinding.ensureInitialized();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            testContext = context;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.showTnBottomSheetNav(sampleRoutePath);
            });
            return const SizedBox.shrink();
          }),
        ),
      );
      await tester.pumpAndSettle();
      // Assert
      verifyNever(router.initialize());
      verifyNever(router.go(sampleRoutePath, context: testContext));
    });
  });
}
