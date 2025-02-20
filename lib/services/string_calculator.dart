class StringCalculator {
  /// Adds numbers provided in a delimited string.
  ///
  /// - Default delimiters: Comma (`,`) and newline (`\n`).
  /// - Supports custom delimiters defined in the format: `//[delimiter]\n[numbers...]`.
  /// - Returns 0 if the input string is empty.
  /// - Returns Error if the number is negative.
  ///
  /// Example usages:
  /// ```
  /// add("1,2,3") -> 6
  /// add("1\n2,3") -> 6
  /// add("//;\n1;2;3") -> 6
  /// Custom delimiter ";"
  /// ```
  int add(String numbers) {
    // Return 0 if input is empty
    if (numbers.isEmpty) return 0;

    // Default delimiter: comma `,` and newline `\n`
    String delimiter = r'[\n,]';

    // Check if input specifies a custom delimiter using the format "//[delimiter]\n[numbers...]"
    final customDelimiterMatch = RegExp(r'^//(.+)\n').firstMatch(numbers);
    if (customDelimiterMatch != null) {
      // Extract custom delimiter and allow newlines as well
      delimiter = '${RegExp.escape(customDelimiterMatch.group(1)!)}|\n';

      // Remove the custom delimiter definition from the input string
      numbers = numbers.substring(customDelimiterMatch.end);
    }

    // Split the numbers using the extracted/custom delimiter
    var sanitizedNumbers = numbers
        .split(RegExp(delimiter)) // Regex allows multiple delimiters
        .where((number) => number.trim().isNotEmpty) // Ignore empty values
        .map(int.parse); // Convert to integers

    // 🔴 Find negative numbers
    var negativeNumbers = sanitizedNumbers.where((n) => n < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw FormatException("Negative numbers not allowed [${negativeNumbers.join(', ')}]");
    }

    // Return the sum of all numbers, or 0 if the list is empty
    return sanitizedNumbers.isEmpty ? 0 : sanitizedNumbers.reduce((a, b) => a + b);
  }
}
