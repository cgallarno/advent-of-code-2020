import 'dart:io';

import 'package:test/test.dart';
import 'package:aoc2020/day02.dart';

const String dataFilePath = './data/day02.txt';

void main() {
  // List<String> data = File(dataFilePath).readAsLinesSync();
  String data = File(dataFilePath).readAsStringSync();
  group('Scenario One', () {
    test('example', () {
      expect(null, equals(null));
    });

    test('solution', () {
      int result = null;
      print('Your Answer: $result');
      expect(result, equals(null));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      expect(null, equals(null));
    });

    test('solution', () {
      int result = null;
      print('Your Answer: $result');
      expect(result, equals(null));
    });
  });
}
