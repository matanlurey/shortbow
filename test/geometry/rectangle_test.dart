import 'package:shortbow/geometry.dart';
import 'package:shortbow/src/common.dart';
import 'package:test/test.dart';

void main() {
  group('$Rectangle', () {
    test('should correctly set coordinates', () {
      const rect = const Rectangle(2, 4, 4, 8);
      expect(rect.left, 2);
      expect(rect.top, 4);
      expect(rect.width, 4);
      expect(rect.height, 8);
      expect(rect.right, 6);
      expect(rect.bottom, 12);
    });

    test('should override == and hashCode', () {
      expect(const Rectangle(2, 4, 4, 8), _newRect(2, 4, 4, 8));
    });

    test('should have a readable toString() in debug mode', () {
      expect(
        '${const Rectangle(2, 4, 4, 8)}',
        '$Rectangle {l = 2, t = 4, w = 4, h = 8}',
      );
    }, skip: !isDebugMode);
  });
}

// Always uses "new" instead of "const".
//
// In an actual application this is not important, in this test we want to
// specifically call it out (we are testing the behavior of value-type-like
// object).
Rectangle _newRect(int x, int y, int w, int h) => new Rectangle(x, y, w, h);
