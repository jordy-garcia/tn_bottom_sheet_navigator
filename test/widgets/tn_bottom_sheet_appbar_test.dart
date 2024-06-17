import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tn_bottom_sheet_navigator/tn_bottom_sheet_navigator.dart';

import '../core/tn_bottom_sheet_trigger_test.mocks.dart';
import '../test_utils/mock_data.dart';

import 'tn_bottom_sheet_appbar_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NavigatorObserver>(),
])
void main() {
  final router = TnRouter()..setRoutes(sampleRouteList);
  group('TnBottomSheetAppBar', () {
    test('it should render with default props', () {
      const sut = TnBottomSheetAppBar();
      expect(sut.customTitle, isA<Null>());
      expect(sut.showCloseIcon, false);
      expect(sut.title, isA<Null>());
      expect(sut.theme, isA<Null>());
    });

    testWidgets('if title is passed it should render it', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TnBottomSheetAppBar(title: 'test'),
        ),
      );

      expect(find.byKey(const Key('tn_bottom_sheet_appbar_title')), findsOne);
    });

    testWidgets('if customTitle is passed it should render it', (tester) async {
      const customTitleKey = Key('custom_title_test');
      await tester.pumpWidget(
        MaterialApp(
          home: TnBottomSheetAppBar(
            customTitle: Container(
              key: customTitleKey,
            ),
          ),
        ),
      );

      expect(find.byKey(customTitleKey), findsOne);
    });

    testWidgets(
        'if customTitle and title are passed it should render the title',
        (tester) async {
      const customTitleKey = Key('custom_title_test');
      await tester.pumpWidget(
        MaterialApp(
          home: TnBottomSheetAppBar(
            title: 'test',
            customTitle: Container(
              key: customTitleKey,
            ),
          ),
        ),
      );

      expect(find.byKey(customTitleKey), findsNothing);
      expect(find.byKey(const Key('tn_bottom_sheet_appbar_title')), findsOne);
    });

    testWidgets('if showCloseIcon it should render the close icon button',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TnBottomSheetAppBar(
            showCloseIcon: true,
          ),
        ),
      );

      expect(
          find.byKey(const Key('tn_bottom_sheet_appbar_closeicon')), findsOne);
    });

    testWidgets(
        'if TnRouter has routes in the stack it should render the arrowback button',
        (tester) async {
      router.push(sampleRoutePath);
      router.push(homeSampleRoutePath);
      await tester.pumpWidget(
        const MaterialApp(
          home: TnBottomSheetAppBar(),
        ),
      );

      expect(
        find.byKey(
          const Key('tn_bottom_sheet_appbar_backbutton'),
        ),
        findsOne,
      );
    });

    testWidgets('the backbutton invokes the TnRouter pop method',
        (tester) async {
      final tnRouter = TnRouter.instance = MockTnRouter();
      when(tnRouter.canPop).thenReturn(true);
      await tester.pumpWidget(
        const MaterialApp(
          home: TnBottomSheetAppBar(),
        ),
      );

      final backButton = find.byKey(
        const Key('tn_bottom_sheet_appbar_backbutton'),
      );
      await tester.tap(backButton);

      verify(tnRouter.pop()).called(1);
    });

    testWidgets('closeIconButton should invoke Navigator.pop', (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: const TnBottomSheetAppBar(
            showCloseIcon: true,
          ),
        ),
      );

      final closeIconButton = find.byKey(
        const Key('tn_bottom_sheet_appbar_closeicon'),
      );
      await tester.tap(closeIconButton);
      await tester.pumpAndSettle();

      verify(mockObserver.didPop(any, any)).called(1);
    });
  });
}
