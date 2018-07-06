import '../common.dart';

/// A 2-dimensional [Rectangle], represented by coordinates and width/height.
class Rectangle {
  /// Origin x-axis coordinate.
  final int left;

  /// Origin y-axis coordinate.
  final int top;

  /// Height of the rectangle.
  final int height;

  /// Width of the rectangle.
  final int width;

  /// Creates a rectangle at [left] [top] of [width] [height].
  const Rectangle(this.left, this.top, this.width, this.height)
      : assert(left != null && left >= 0),
        assert(top != null && top >= 0),
        assert(height != null && height >= 1),
        assert(width != null && width >= 1);

  /// Right position of the rectangle.
  int get right => left + width;

  /// Bottom position of the rectangle.
  int get bottom => top + height;

  @override
  bool operator ==(Object o) {
    if (o is Rectangle) {
      return left == o.left &&
          top == o.top &&
          height == o.height &&
          width == o.width;
    }
    return false;
  }

  @override
  int get hashCode => hash4(left, top, height, width);

  @override
  String toString() {
    if (assertionsEnabled) {
      return '$Rectangle {l = $left, t = $top, w = $width, h = $height}';
    }
    return super.toString();
  }
}
