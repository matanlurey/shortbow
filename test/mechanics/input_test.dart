import 'package:shortbow/mechanics.dart';
import 'package:test/test.dart';

void main() {
  test('should support a simple button', () {
    final controller = ButtonController();
    final button = controller.input;
    expect(button.active, isFalse);
    expect(button.inactive, isTrue);

    controller.active = true;
    expect(button.active, isFalse);
    expect(button.inactive, isTrue);

    controller.update();
    expect(button.active, isTrue);
    expect(button.inactive, isFalse);
  });

  test('should support composite buttons', () {
    final ctrlKeyController = ButtonController();
    final sKeyController = ButtonController();
    final ctrlS = ctrlKeyController.input + sKeyController.input;
    expect(ctrlS.active, isFalse);

    ctrlKeyController
      ..active = true
      ..update();
    expect(ctrlS.active, isFalse);

    sKeyController
      ..active = true
      ..update();
    expect(ctrlS.active, isTrue);
  });
}
