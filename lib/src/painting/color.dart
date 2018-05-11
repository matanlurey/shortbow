import 'package:shortbow/src/common.dart';

// Mostly adapted from the `Color` class from Flutter's Engine:
// https://github.com/flutter/engine/blob/master/lib/ui/painting.dart
//
// Thanks to everyone involved in creating (and testing) that code!

/// An immutable 32-bit color value in ARGB format.
@Immutable()
class Color {
  /// A 32 bit value representing this color.
  ///
  /// The bits are assigned as follows:
  ///
  /// * Bits 24-31 are the alpha value.
  /// * Bits 16-23 are the red value.
  /// * Bits 8-15 are the green value.
  /// * Bits 0-7 are the blue value.
  final int value;

  /// Create a color from the lower 32 bits of an [int].
  ///
  /// The bits are interpreted as follows:
  ///
  /// * Bits 24-31 are the [alpha] value.
  /// * Bits 16-23 are the [red] value.
  /// * Bits 8-15 are the [green] value.
  /// * Bits 0-7 are the [blue] value.
  ///
  /// In other words, if AA is the alpha value in hex, RR the red value in hex,
  /// GG the green value in hex, and BB the blue value in hex, a color can be
  /// expressed as `const Color(0xAARRGGBB)`.
  ///
  /// For example, to get a fully opaque orange, you would use `const
  /// Color(0xFFFF9000)` (`FF` for the alpha, `FF` for the red, `90` for the
  /// green, and `00` for the blue).
  const Color(int value) : value = value & 0xFFFFFFFF;

  /// Construct a color from the lower 8 bits of four integers.
  ///
  /// * [a] is [alpha], with 0 being transparent and 255 being fully opaque.
  /// * [r] is [red], from 0 to 255.
  /// * [g] is [red], from 0 to 255.
  /// * [b] is [red], from 0 to 255.
  ///
  /// Out of range values are brought into range using modulo 255.
  const Color.fromARGB(int a, int r, int g, int b)
      : value = (((a & 0xFF) << 24) |
                ((r & 0xFF) << 16) |
                ((g & 0xFF) << 8) |
                ((b & 0xFF) << 0)) &
            0xFFFFFFFF;

  /// Create a color from red, green, blue, and opacity (like `rgba()` in CSS).
  ///
  /// * [r] is [red], from `0` to `255`.
  /// * [g] is [green], from `0` to `255`.
  /// * [b] is [blue], from `0` to `255`.
  /// * [opacity] is the [alpha] channel of this color as a double, with `0.0`
  ///   being transparent and `1.0` being fully opaque.
  ///
  /// Out of range values are brought into range using modulo 255.
  const Color.fromRGBO(int r, int g, int b, double opacity)
      : value = ((((opacity * 0xFF ~/ 1) & 0xFF) << 24) |
                ((r & 0xFF) << 16) |
                ((g & 0xFF) << 8) |
                ((b & 0xFF) << 0)) &
            0xFFFFFFFF;

  /// The alpha channel of this color in an 8 bit value.
  ///
  /// * A value of `0` means this color is fully transparent.
  /// * A value of `255` means this color is fully opaque.
  int get alpha => (0xFF000000 & value) >> 24;

  /// The alpha channel of this color as a double.
  ///
  /// * A value of `0.0` means this color is fully transparent.
  /// * A value of `1.0` means this color is fully opaque.
  double get opacity => alpha / 0xFF;

  /// The red channel of this color in an 8 bit value.
  int get red => (0x00FF0000 & value) >> 16;

  /// The green channel of this color in an 8 bit value.
  int get green => (0x0000FF00 & value) >> 8;

  /// The blue channel of this color in an 8 bit value.
  int get blue => (0x000000FF & value) >> 0;

  @override
  bool operator==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is Color) {
      return value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    if (isDebugMode) {
      final hexString = value.toRadixString(16).toUpperCase();
      return 'Color {0x${hexString.padLeft(8, '0')}}';
    }
    return super.toString();
  }
}
