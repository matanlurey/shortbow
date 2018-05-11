import 'package:shortbow/geometry.dart';
import 'package:shortbow/src/common.dart';
import 'package:test/test.dart';

void main() {
  group('$Point', () {
    test('.origin should represent (0, 0)', () {
      expect(Point.origin, const Point(0, 0));
      expect(Point.origin, _newPoint(0, 0));
    });

    test('should correctly set an x and y coordinate', () {
      const point = const Point(5, 10);
      expect(point.x, 5);
      expect(point.y, 10);
    });

    test('should override == and hashCode', () {
      expect(const Point(1, 2), _newPoint(1, 2));
      expect(const Point(1, 2).hashCode, _newPoint(1, 2).hashCode);
    });

    test('should have a readable toString() in debug mode', () {
      expect('${const Point(1, 2)}', '$Point {1, 2}');
    }, skip: !isDebugMode);
  });
}

// Always uses "new" instead of "const".
//
// In an actual application this is not important, in this test we want to
// specifically call it out (we are testing the behavior of value-type-like
// object).
Point _newPoint(int x, int y) => new Point(x, y);
