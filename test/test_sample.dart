import 'dart:io';
import 'package:test/test.dart';
import 'package:aoc2020/sample_day.dart';

const String dataFilePath = './data/sample.txt';

final sampleData = [];
void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();

  group('Scenario One', () {
    test('example', () {
      var result = solve(sampleData);
      expect(result, isNot(null));
    });

    test('answer', () {
      int result = solve(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      var result = solve(sampleData);
      expect(result, isNot(null));
    });

    test('answer', () {
      int result = solve(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
    });
  });
}
