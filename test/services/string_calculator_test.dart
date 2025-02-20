import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_assessment/services/string_calculator.dart';


void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('Returns 0 for an empty string', () {
    expect(calculator.add(""), equals(0));
  });

  test('Returns the number itself when only one number is provided', () {
    expect(calculator.add("5"), equals(5));
  });

  test('Returns the sum of two numbers', () {
    expect(calculator.add("2,3"), equals(5));
  });

}
