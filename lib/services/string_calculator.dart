class StringCalculator {
  /// Adds numbers provided in a delimited string.
  ///
  /// - Default delimiters: Comma (`,`) and newline (`\n`).
  /// - Supports custom delimiters defined in the format: `//[delimiter]\n[numbers...]`.
  /// - Returns 0 if the input string is empty.
  /// - Returns Error if the number is negative.
  /// - Numbers bigger than 1000 should be ignored
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

    // Check if the input string starts with a custom delimiter declaration
    if (numbers.startsWith('//')) {
      // Find the index where the delimiter section ends (newline character `\n`)
      final delimiterEndIndex = numbers.indexOf('\n');

      // Extract the delimiter section (between `//` and `\n`)
      final delimiterSection = numbers.substring(2, delimiterEndIndex);

      // Define a regex pattern to detect custom delimiters enclosed in square brackets `[...]`
      final delimiterPattern = RegExp(r'\[.*?\]');

      // Find all matches of custom delimiters in the delimiter section
      final matches = delimiterPattern.allMatches(delimiterSection);

      if (matches.isNotEmpty) {
        // If multiple delimiters are found, extract and escape them for regex use
        delimiter = [
          ',',  // Always include comma
          '\n', // Always include newline
          ...matches.map((match) {
            return RegExp.escape(match.group(0)!.replaceAll('[', '').replaceAll(']', '')); // Remove brackets and escape
          })
        ].join('|'); // Join all delimiters with `|` for regex OR condition

      } else {
        // If no brackets are found, treat the entire section as a single custom delimiter
        delimiter = RegExp.escape(delimiterSection);
      }

      // Remove the delimiter declaration from the input string, leaving only the numbers
      numbers = numbers.substring(delimiterEndIndex + 1);
    }

    // Split the numbers using the extracted/custom delimiter
    var sanitizedNumbers = numbers
        .split(RegExp(delimiter)) // Regex allows multiple delimiters
        .where((number) => number.trim().isNotEmpty) // Ignore empty values
        .map(int.parse); // Convert to integers

    // 🔴 Find negative numbers
    var negativeNumbers = sanitizedNumbers.where((n) => n < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw FormatException(
          "Negative numbers not allowed [${negativeNumbers.join(', ')}]");
    }

    // Return the sum of all numbers, or 0 if the list is empty
    return sanitizedNumbers.isEmpty
        ? 0
        : sanitizedNumbers
            .where((number) => number <= 1000) // Numbers bigger than 1000 should be ignored
            .reduce((a, b) => a + b);
  }
}
