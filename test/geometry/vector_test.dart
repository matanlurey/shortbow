import 'package:shortbow/geometry.dart';
import 'package:shortbow/src/common.dart';
import 'package:test/test.dart';

void main() {
  group('$Vector', () {
    test('.origin should represent (0, 0)', () {
      expect(Vector.origin, const Vector(0, 0));
      expect(Vector.origin, _new(0, 0));
    });

    test('should correctly set an x and y coordinate', () {
      const point = Vector(5, 10);
      expect(point.x, 5);
      expect(point.y, 10);
    });

    test('should override == and hashCode', () {
      expect(const Vector(1, 2), _new(1, 2));
      expect(const Vector(1, 2).hashCode, _new(1, 2).hashCode);
    });

    test('should add coordinates', () {
      expect(const Vector(1, 2) + const Vector(4, 8), const Vector(5, 10));
      expect(const Vector(1, 2).addBy(4, 8), const Vector(5, 10));
    });

    test('should multiply coordinates', () {
      expect(const Vector(1, 2) * const Vector(4, 8), const Vector(4, 16));
      expect(const Vector(1, 2).multiplyBy(4, 8), const Vector(4, 16));
    });

    test('should scale coordinates', () {
      expect(const Vector(1, 2).scaleBy(2), const Vector(2, 4));
    });

    test('should have a readable toString() in debug mode', () {
      expect('${const Vector(1, 2)}', '$Vector {1, 2}');
    }, skip: !assertionsEnabled);
  });
}

// Always uses "new" instead of "const".
//
// In an actual application this is not important, in this test we want to
// specifically call it out (we are testing the behavior of value-type-like
// object).
Vector _new(int x, int y) => Vector(x, y);
