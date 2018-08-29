import '../common.dart';

/// An immmutable pair of [x] and [y] coordinates.
///
/// May be used to represent:
/// * A 2-dimensional [x] and [y] scalar coordinate.
/// * A 2-dimensional measure of force, such as _velocity_.
@immutable
@optionalTypeArgs
class Vector {
  /// Represents `(0, 0)` in the coordinate system.
  static const Vector origin = Vector(0, 0);

  /// X-axis coordinate.
  final num x;

  /// Y-axis coordinate.
  final num y;

  /// Creates a point from the provided x and y-axis coordinates.
  ///
  /// Coordinates must be non-null and at least `0` (no negative values).
  @literal
  const Vector(this.x, this.y)
      : assert(x != null && x >= 0),
        assert(y != null && y >= 0);

  /// Returns the result of adding [another] point to `this`.
  Vector operator +(Vector another) => addBy(another.x, another.y);

  /// Returns the result of adding [x] and [y] to `this`.
  Vector addBy(num x, num y) => Vector(x + this.x, y + this.y);

  /// Returns the result of multiplying [another] point to `this`.
  Vector operator *(Vector another) => multiplyBy(another.x, another.y);

  /// Returns the result of multiplying [x] and [y] to `this`.
  Vector multiplyBy(num x, num y) => Vector(x * this.x, y * this.y);

  /// Returns the result of scaling this pair by a constant [factor].
  Vector scaleBy(num factor) => multiplyBy(factor, factor);

  /// Returns the result of dividng `this` pair by [another].
  Vector operator /(Vector another) => divideBy(another.x, another.y);

  /// Returns the result of dividing `this` pair by [x] and [y].
  Vector divideBy(num x, num y) => Vector(this.x / x, this.y / y);

  @override
  bool operator ==(Object other) {
    if (other is Vector) {
      return x == other.x && y == other.y;
    }
    return false;
  }

  @override
  int get hashCode => hash2(x, y);

  @override
  String toString() {
    if (assertionsEnabled) {
      return '$Vector {$x, $y}';
    }
    return super.toString();
  }
}
