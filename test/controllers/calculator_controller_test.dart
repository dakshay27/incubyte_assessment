import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_assessment/controllers/calculator_controller.dart';

void main() {
  late CalculatorController controller;

  setUp(() {
    controller = CalculatorController();
  });

  test('Calculates sum correctly', () {
    controller.updateInput("2,3,4");
    controller.calculate();
    expect(controller.result.value, "9");
  });

  test('Returns 0 for an empty input', () {
    controller.updateInput("");
    controller.calculate();
    expect(controller.result.value, "0");
  });

}
