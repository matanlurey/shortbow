import 'package:shortbow/common.dart';
import 'package:meta/meta.dart';

/// A 2-dimensional [Rectangle], represented by coordinates and width/height.
class Rectangle {
  /// Origin x-axis coordinate.
  final num left;

  /// Origin y-axis coordinate.
  final num top;

  /// Height of the rectangle.
  final num height;

  /// Width of the rectangle.
  final num width;

  /// Creates a rectangle at [left] [top] of [width] [height].
  @literal
  const Rectangle(this.left, this.top, this.width, this.height)
      : assert(left != null && left >= 0),
        assert(top != null && top >= 0),
        assert(height != null && height >= 1),
        assert(width != null && width >= 1);

  /// Right position of the rectangle.
  num get right => left + width;

  /// Bottom position of the rectangle.
  num get bottom => top + height;

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
