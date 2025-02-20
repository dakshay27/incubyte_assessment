import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_assessment/controllers/calculator_controller.dart';

void main() {
  // Declare a late variable for the CalculatorController instance
  late CalculatorController controller;

  // Setup method to initialize a new instance of CalculatorController before each test
  setUp(() {
    controller = CalculatorController();
  });

  /// Test case: Calculates sum correctly
  ///
  /// - Input: "2,3,4"
  /// - Expected outcome: "9"
  /// - Explanation: The controller should parse the numbers, sum them up, and update the result.
  test('Calculates sum correctly', () {
    controller.updateInput("2,3,4");
    controller.calculate();
    expect(controller.result.value, "9");
  });

  /// Test case: Returns 0 for an empty input
  ///
  /// - Input: ""
  /// - Expected outcome: "0"
  /// - Explanation: If the input is empty, the result should be "0".
  test('Returns 0 for an empty input', () {
    controller.updateInput("");
    controller.calculate();
    expect(controller.result.value, "0");
  });
}
