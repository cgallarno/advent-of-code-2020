import 'dart:io';
import 'package:test/test.dart';
import 'package:aoc2020/day06.dart';

const String dataFilePath = './data/day06.txt';

final sampleData = 'abc\n\na\nb\nc\n\nab\nac\n\na\na\na\na\n\nb';
void main() {
  String data = File(dataFilePath).readAsStringSync();

  group('Scenario One', () {
    test('example', () {
      var result = solve(sampleData);
      expect(result, isNot(null));
      expect(result, equals(11));
    });

    test('answer', () {
      int result = solve(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
      expect(result, equals(6351));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      var result = solve2(sampleData);
      expect(result, isNot(null));
      expect(result, equals(6));
    });

    test('answer', () {
      int result = solve2(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
      expect(result, isNot(3142));
      expect(result, isNot(3141)); // too low
      expect(
          result,
          equals(
              3143)); // Needed to trim an extra newline off the end of the file!
    });
  });
}
