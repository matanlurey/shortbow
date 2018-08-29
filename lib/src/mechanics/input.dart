/// Represents an user-interface input during a game loop.
abstract class Input {
  /// Whether the input is currently active.
  bool get active;

  /// Whether the input is currently inactive.
  bool get inactive => !active;
}

/// Produces an [input], buffering events until [update] is invoked.
abstract class InputController<T extends Input> {
  /// Whether the [input] should be considered active after [update].
  bool active = false;

  /// Produced input.
  T get input;

  /// Updates the produced [input] based on events buffered so far.
  void update();
}

/// Represents a binary [active] or [inactive] state input.
abstract class Button extends Input {
  /// Returns a new button that is [active] when `this` _and_ [other] is.
  Button operator +(Button other) => _CompositeButton([this, other]);
}

class _Button extends Button {
  @override
  bool active = false;
}

class _CompositeButton extends _Button {
  final Iterable<Button> _buttons;

  _CompositeButton(this._buttons)
      : assert(_buttons != null && _buttons.isNotEmpty);

  @override
  bool get active => _buttons.every((b) => b.active);
}

class ButtonController extends InputController<Button> {
  final _input = _Button();

  @override
  Button get input => _input;

  @override
  void update() {
    _input.active = active;
  }
}
