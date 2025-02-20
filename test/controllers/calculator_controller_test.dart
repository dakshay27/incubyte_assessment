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

  /// Test case: Handles custom single-character delimiter ";"
  ///
  /// - Input: "//;\n1;2;3"
  /// - Expected outcome: "6"
  /// - Explanation:
  ///   - The input starts with `//;`, indicating that `;` is the custom delimiter.
  ///   - The numbers `1, 2, and 3` are separated using this delimiter.
  ///   - The function should correctly parse and sum the numbers.
  test('Handles custom delimiter ";"', () {
    controller.updateInput("//;\n1;2;3");
    controller.calculate();
    expect(controller.result.value, "6");
  });

  /// Test case: Throws an exception for negative numbers
  ///
  /// - Input: `"1,-2,3,-4"`
  /// - Expected Outcome: `"Exception: Negative numbers not allowed: -2, -4"`
  /// - Explanation:
  ///   - The controller receives an input string containing negative numbers.
  ///   - When `calculate()` is called, it processes the input using `StringCalculator`.
  ///   - If negative numbers are found, an exception message should be stored in `result.value`.
  ///   - The test verifies that the exception message correctly lists all negative numbers.
  test('Throws an exception for negative numbers', () {
    controller.updateInput("1,-2,3,-4");
    controller.calculate();
    expect(controller.result.value, "Negative numbers not allowed [-2, -4]");
  });

  /// Test case: Ignores numbers greater than 1000
  ///
  /// - Input: `"2,1001,3"`
  /// - Expected Outcome: `"5"`
  /// - Explanation:
  ///   - The input contains the numbers `2`, `1001`, and `3`.
  ///   - The calculator should **ignore numbers greater than 1000**.
  ///   - `1001` is ignored, so the sum is `2 + 3 = 5`.
  ///   - The test verifies that only valid numbers are summed.
  test('Ignores numbers greater than 1000', () {
    controller.updateInput("2,1001,3");
    controller.calculate();
    expect(controller.result.value, "5");
  });
}
