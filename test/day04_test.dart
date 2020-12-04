import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import 'package:aoc2020/day04.dart';

const String dataFilePath = './data/day04.txt';

void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();
  // String datcleara = File(dataFilePath).readAsStringSync();

  List<String> sampleData = [];

  group('Scenario One', () {
    test('example', () {
      expect(solve(sampleData), equals(0));
    });
    test('solution', () {
      int result = solve(data);
      print('Your Answer: $result');

      expect(result, equals(null));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      expect(solve(sampleData), equals(0));
    });

    test('solution', () {
      int result = solve(data);
      print('Your Answer: $result');

      expect(result, equals(null));
    });
  });
}
