import '../common.dart' show assertionsEnabled, hash2, immutable;

/// A 2-dimensional [x] and [y] coordinate pair.
@immutable
class Point {
  /// Represents `(0, 0)` in the coordinate system.
  static const Point origin = Point(0, 0);

  /// X-axis coordinate.
  final int x;

  /// Y-axis coordinate.
  final int y;

  /// Creates a point from the provided x and y-axis coordinates.
  ///
  /// Coordinates must be non-null and at least `0` (no negative values).
  const Point(this.x, this.y)
      : assert(x != null && x >= 0),
        assert(y != null && y >= 0);

  @override
  bool operator ==(Object other) {
    if (other is Point) {
      return x == other.x && y == other.y;
    }
    return false;
  }

  @override
  int get hashCode => hash2(x, y);

  @override
  String toString() {
    if (assertionsEnabled) {
      return '$Point {$x, $y}';
    }
    return super.toString();
  }
}
