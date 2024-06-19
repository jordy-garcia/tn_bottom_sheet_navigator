import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';

import '../test_utils/mock_data.dart';
import 'tn_router_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BuildContext>(),
])
void main() {
  final TnRouter sut = TnRouter()..setRoutes(sampleRouteList);
  final BuildContext testContext = MockBuildContext();

  setUp(() {
    sut.clear();
    sut.initialize();
  });

  group('push', () {
    test(
        'when it found the route by path, it adds the route in the end of the stack',
        () {
      // Act
      sut.push(
        sampleRoutePath,
        context: testContext,
      );
      // Assert
      expect(sut.count == 1, true);
    });

    test('when it did not find the route by path, it does nothing', () {
      // Act
      sut.push('not-existent-route', context: testContext);
      // Assert
      expect(sut.count == 0, true);
    });
  });

  group('go', () {
    test('it clears previous stack routes and adds the new path', () {
      // Arrange
      sut.push(sampleRoutePath, context: testContext);
      // Act
      sut.go(homeSampleRoutePath, context: testContext);
      // Assert
      expect(sut.count, 1);
    });
  });

  group('pop', () {
    test('it removes the last route in the stack', () {
      // Arrange
      sut.push(sampleRoutePath, context: testContext);
      sut.push(homeSampleRoutePath, context: testContext);
      // Act
      sut.pop();
      // Assert
      expect(sut.count, 1);
    });
  });

  group('clear', () {
    test('it removes all routes in the stack', () {
      // Arrange
      sut.push(sampleRoutePath, context: testContext);
      sut.push(homeSampleRoutePath, context: testContext);
      // Act
      sut.clear();
      // Assert
      expect(sut.count, 0);
    });
  });

  group('initialize', () {
    test('it changes opened status', () {
      // Act
      sut.initialize();
      // Assert
      expect(sut.isOpened, true);
    });
  });

  group('dispose', () {
    test('it changes the opened status to false', () {
      // Arrange
      sut.initialize();
      // Act
      sut.dispose();
      // Assert
      expect(sut.isOpened, false);
    });
  });
}
