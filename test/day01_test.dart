import 'dart:io';
import 'dart:core';
import 'package:test/test.dart';
import 'package:aoc2020/day01.dart';

const String dataFilePath = './data/day01.txt';
void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();

  group('Scenario One', () {
    test('example', () {
      expect(findEntryTotal([1721, 979, 366, 299, 675, 1456]), equals(514579));
    });

    test('answer', () {
      var asIntegers = data.map((s) => int.parse(s));
      int result = findEntryTotal(asIntegers.toList());
      print('Your Answer: $result');
      expect(result, equals(482811));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      expect(
          findEntryTotal([1721, 979, 366, 299, 675, 1456],
              useThreeEntries: true),
          equals(241861950));
    });

    test('answer', () {
      var asIntegers = data.map((s) => int.parse(s));
      int result = findEntryTotal(asIntegers.toList(), useThreeEntries: true);
      expect(result, isNot(737559));
      print('Your Answer: $result');
      expect(result, equals(193171814));
    });
  });
}
