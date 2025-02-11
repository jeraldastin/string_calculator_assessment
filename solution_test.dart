import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('returns 0 for an empty string', () {
    expect(calculator.add(""), equals(0));
  });

  test('returns the number itself when a single number is provided', () {
    expect(calculator.add("1"), equals(1));
  });

  test('returns sum of two numbers separated by a comma', () {
    expect(calculator.add("1,2"), equals(3));
  });

  test('handles an unknown amount of numbers', () {
    expect(calculator.add("1,2,3,4,5"), equals(15));
  });

  test('handles new lines as delimiters', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  test('supports custom delimiters', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  test('throws an exception for a negative number', () {
    expect(() => calculator.add("1,-2,3"), throwsA(isA<FormatException>()));
  });

  test('throws an exception for multiple negative numbers', () {
    expect(() => calculator.add("1,-2,-3,4"),
        throwsA(predicate((e) => e is FormatException && e.message == "Negatives not allowed: -2, -3")));
  });
}
