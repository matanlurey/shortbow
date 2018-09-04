import 'package:shortbow/common.dart';
import 'package:shortbow/painting.dart';
import 'package:test/test.dart';

void main() {
  group('$Color', () {
    test('should extract various values properly', () {
      const fullyOpaqueOrange = Color(0xFFFF9000);
      expect(fullyOpaqueOrange.alpha, 0xFF);
      expect(fullyOpaqueOrange.red, 0xFF);
      expect(fullyOpaqueOrange.green, 0x90);
      expect(fullyOpaqueOrange.blue, 0x00);
      expect(
        '$fullyOpaqueOrange',
        'Color {0xFFFF9000}',
        skip: !assertionsEnabled,
      );
    });
  });
}
