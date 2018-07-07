import 'dart:math' show Random;

/// Rolls and returns the result of rolling virtual dice.
///
/// This class is not intended to be implemented, extended, or mixed-in.
abstract class DiceRoller {
  const DiceRoller._();

  /// Creates a new [DiceRoller] with a default [Random] implementation.
  ///
  /// This constructor is mostly provided for convenience, but serious usages
  /// are heavily recommended to use [DiceRoller.seeded] directly or go through
  /// [DiceRoller.generate] with an external randomization source.
  factory DiceRoller() => DiceRoller.seeded(Random());

  /// Creates a [DiceRoller] that generates rolls using a [delegate] function.
  ///
  /// This generator function _could_ be backed by [Random], but could even
  /// return results that are predetermined (i.e. for testing or simulations).
  const factory DiceRoller.generate(
    int Function(int sides) delegate,
  ) = _DiceRoller;

  /// Creates a [DiceRoller] that generates rolls using the provided [random].
  factory DiceRoller.seeded(Random random) {
    return _DiceRoller((sides) => random.nextInt(sides) + 1);
  }

  /// Rolls and returns the result of a single dice with n-[sides].
  int roll(int sides);

  /// Returns a lazy iterable of the results of rolling `{amount}N{sides}` dice.
  Iterable<int> rollMany(int amount, int sides) {
    return Iterable.generate(amount, (_) => roll(sides));
  }

  /// Returns the sum of rolling `{amount}N{sides}` dice.
  ///
  /// This is semantically the same as:
  /// ```
  /// diceRoller.rollMany(2, 6).fold(0, (a, b) => a + b);
  /// ```
  int rollSum(int amount, int sides) {
    var sum = 0;
    for (var i = 0; i < amount; i++) {
      sum += roll(sides);
    }
    return sum;
  }
}

/// Implements [DiceRoller] using a pre-defined generator function.
///
/// This generator function could be backed by [Random] or even return results
/// that are predetermined (i.e. for testing or simulations).
class _DiceRoller extends DiceRoller {
  final int Function(int sides) _delegate;

  const _DiceRoller(this._delegate)
      : assert(_delegate != null),
        super._();

  @override
  int roll(int sides) => _delegate(sides);
}
