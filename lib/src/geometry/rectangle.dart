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

  /// Creates a rectangle at [x] and [y] of the specified [height], [width].
  const Rectangle(int x, int y, this.height, this.width)
      : assert(x != null && x >= 0),
        assert(y != null && y >= 0),
        assert(height != null && height >= 1),
        assert(width != null && width >= 1),
        // ignore: prefer_initializing_formals
        left = x,
        // ignore: prefer_initializing_formals
        top = y;

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
    if (isDebugMode) {
      return '$Rectangle {l = $left, t = $top, w = $width, h = $height}';
    }
    return super.toString();
  }
}
