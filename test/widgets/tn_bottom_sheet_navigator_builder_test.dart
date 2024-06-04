import 'package:flutter_test/flutter_test.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/widgets/tn_bottom_sheet_navigator_builder.dart';

import '../test_utils/mock_data.dart';

void main() {
  final router = TnRouter()..setRoutes(sampleRouteList);

  group('TnBottomSheetNavigatorBuilder', () {
    testWidgets('If a route is pushed, the route builder is rendered',
        (tester) async {
      router.push(sampleRoutePath);
      await tester.pumpWidget(const TnBottomSheetNavigatorBuilder());
      await tester.pump();
      // Assert
      expect(find.byKey(sampleRouteKey), findsOneWidget);
    });
  });
}
