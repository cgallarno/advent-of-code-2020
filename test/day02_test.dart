import 'dart:io';

import 'package:test/test.dart';
import 'package:aoc2020/day02.dart';

const String dataFilePath = './data/day02.txt';

void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();
  // String data = File(dataFilePath).readAsStringSync();
  group('Scenario One', () {
    test('example', () {
      expect(
          testPasswords(['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc']),
          equals(2));
    });

    test('curated list', () {
      expect(
          testPasswords([
            '1-3 a: abcde',
            '1-3 b: cdefg',
            '2-9 c: ccccccccc',
            '12-13 t: tttttztttttttt'
          ]),
          equals(3));
    });

    test('solution', () {
      int result = testPasswords(data);
      print('Your Answer: $result');
      expect(result, isNot(157));
      expect(result, equals(546));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      expect(
          testPasswords(['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc'],
              officalPolicy: true),
          equals(1));
    });

    test('solution', () {
      int result = testPasswords(data, officalPolicy: true);
      print('Your Answer: $result');
      expect(result, equals(275));
    });
  });
}
