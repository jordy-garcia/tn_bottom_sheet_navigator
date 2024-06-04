import 'package:flutter_test/flutter_test.dart';
import 'package:tn_bottom_sheet_navigator/core/tn_router.dart';

import '../test_utils/mock_data.dart';

void main() {
  final TnRouter sut = TnRouter()..setRoutes(sampleRouteList);

  setUp(() {
    sut.clear();
    sut.initialize();
  });

  group('push', () {
    test(
        'when it found the route by path, it adds the route in the end of the stack',
        () {
      // Act
      sut.push(sampleRoutePath);
      // Assert
      expect(sut.lastRoute, sampleRoute);
    });

    test('when it did not find the route by path, it does nothing', () {
      // Act
      sut.push('not-existent-route');
      // Assert
      expect(sut.count == 0, true);
    });
  });

  group('go', () {
    test('it clears previous stack routes and adds the new path', () {
      // Arrange
      sut.push(sampleRoutePath);
      // Act
      sut.go(homeSampleRoutePath);
      // Assert
      expect(sut.count, 1);
      expect(sut.lastRoute, homeSampleRoute);
    });
  });

  group('pop', () {
    test('it removes the last route in the stack', () {
      // Arrange
      sut.push(sampleRoutePath);
      sut.push(homeSampleRoutePath);
      // Act
      sut.pop();
      // Assert
      expect(sut.lastRoute, sampleRoute);
    });
  });

  group('clear', () {
    test('it removes all routes in the stack', () {
      // Arrange
      sut.push(sampleRoutePath);
      sut.push(homeSampleRoutePath);
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
