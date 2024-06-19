import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';
import 'package:tn_bottom_sheet_navigator/extensions/tn_context_extensions.dart';

import '../core/tn_bottom_sheet_trigger_test.mocks.dart';
import '../core/tn_router_test.mocks.dart';

void main() {
  late TnRouter router = MockTnRouter();
  late BuildContext context = MockBuildContext();

  setUp(() {
    TnRouter.instance = router;
  });

  group('Getter tnRouter', () {
    test('it should return an instance of TnRouter', () {
      final instance = context.tnRouter;
      expect(instance, router);
    });
  });

  group('tnGo', () {
    test('it invokes go method from TnRouter', () {
      context.tnGo('test');
      verify(router.go('test', context: context)).called(1);
    });
  });

  group('tnPush', () {
    test('it invokes push method from TnRouter', () {
      context.tnPush('test');
      verify(router.push('test', context: context)).called(1);
    });
  });

  group('tnPop', () {
    test('it invokes pop method from TnRouter', () {
      context.tnPop();
      verify(router.pop()).called(1);
    });
  });
}
