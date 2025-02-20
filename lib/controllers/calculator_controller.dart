import 'package:get/get.dart';
import '../services/string_calculator.dart';

/// Controller for the Calculator, managing input and calculation logic using GetX.
class CalculatorController extends GetxController {
  /// Observable variable to store user input as a string.
  var input = "".obs;

  /// Observable variable to store the calculated result as a string.
  var result = "".obs;

  /// Instance of StringCalculator to perform calculations.
  final StringCalculator _calculator = StringCalculator();

  /// Updates the input value whenever the user types in the text field.
  ///
  /// - [value]: The new input string provided by the user.
  void updateInput(String value) {
    input.value = value;
  }

  /// Processes the input string, calculates the sum, and updates the result.
  ///
  /// - If the calculation is successful, the result is stored as a string.
  /// - If an error occurs (e.g., invalid input), the error message is displayed.
  void calculate() {
    try {
      final sum = _calculator.add(input.value);
      result.value = sum.toString();
    } catch (e) {
      result.value = e.toString();
    }
  }
}
