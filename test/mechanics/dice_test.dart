import 'dart:math';

import 'package:shortbow/mechanics.dart';
import 'package:test/test.dart';

void main() {
  test('should roll a dice [predefined generator]', () {
    final roller = DiceRoller.generate((sides) => sides);
    expect(roller.roll(6), 6);
    expect(roller.roll(20), 20);
  });

  test('should roll a dice [random seed]', () {
    final seeded = Random(1001);
    final expected = seeded.nextInt(20) + 1;
    final roller = DiceRoller.seeded(Random(1001));
    expect(roller.roll(20), expected);
  });

  test('should roll a dice [random default]', () {
    final roller = DiceRoller();
    // Roll enough times to ensure its "working".
    for (var i = 0; i < 100; i++) {
      final result = roller.roll(6);
      expect(result, allOf(greaterThanOrEqualTo(1), lessThanOrEqualTo(6)));
    }
  });

  test('should roll (and sum) many dice', () {
    final results = [1, 2, 3, 4, 5, 6];
    var counter = -1;
    final roller = DiceRoller.generate((sides) {
      assert(sides == results.length);
      counter++;
      if (counter > 5) {
        counter = 0;
      }
      return results[counter];
    });
    expect(roller.rollMany(6, 6), [1, 2, 3, 4, 5, 6]);
    expect(roller.rollSum(6, 6), 1 + 2 + 3 + 4 + 5 + 6);
  });
}
