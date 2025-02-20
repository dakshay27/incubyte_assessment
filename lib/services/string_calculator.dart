/// A simple String Calculator class that adds numbers from a given string.
class StringCalculator {
  /// Adds numbers from a comma-separated string.
  ///
  /// - If the input string is empty, it returns 0.
  /// - Otherwise, it splits the string by commas and newline, converts them to integers,
  ///   and sums them up.
  ///
  /// Example:
  /// ```dart
  /// StringCalculator calculator = StringCalculator();
  /// int result = calculator.add("1/n2,3"); // Returns 6
  /// ```
  int add(String numbers) {
    // Return 0 if the input string is empty
    if (numbers.isEmpty) return 0;

    // Split the input string by commas and newline convert each value to an integer,
    // and sum them up using `reduce`
    return numbers
        .split(RegExp(r'[\n,]')) // split the input by commas(,) and newline(\n)
        .map(int.parse)
        .reduce((a, b) => a + b);
  }
}
