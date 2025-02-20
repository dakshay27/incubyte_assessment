import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_assessment/services/string_calculator.dart';

void main() {
  // Declare a late variable for the StringCalculator instance
  late StringCalculator calculator;

  // Setup method to initialize a new instance of StringCalculator before each test
  setUp(() {
    calculator = StringCalculator();
  });

  /// Test case: Returns 0 for an empty string
  ///
  /// - Expected outcome: The method should return `0` when an empty string is provided.
  test('Returns 0 for an empty string', () {
    expect(calculator.add(""), equals(0));
  });

  /// Test case: Returns the number itself when only one number is provided
  ///
  /// - Input: "5"
  /// - Expected outcome: 5
  test('Returns the number itself when only one number is provided', () {
    expect(calculator.add("5"), equals(5));
  });

  /// Test case: Returns the sum of two numbers
  ///
  /// - Input: "2,3"
  /// - Expected outcome: 5
  test('Returns the sum of two numbers', () {
    expect(calculator.add("2,3"), equals(5));
  });

  /// Test case: Handles multiple numbers correctly
  ///
  /// - Input: "1,2,3,4,5"
  /// - Expected outcome: 15
  test('Handles multiple numbers correctly', () {
    expect(calculator.add("1,2,3,4,5"), equals(15));
  });

  /// Test case: Handles newline as a delimiter
  ///
  /// - Input: "1\n2,3"
  /// - Expected outcome: 6
  /// - Explanation: The function should be able to handle newlines along with commas.
  test('Handles newline as a delimiter', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });
}
