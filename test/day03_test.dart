import 'dart:io';
import 'package:test/test.dart';
import 'package:aoc2020/day03.dart';

const String dataFilePath = './data/day03.txt';

void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();
  // String datcleara = File(dataFilePath).readAsStringSync();
  List<String> map = [
    '..##.......',
    '#...#...#..',
    '.#....#..#.',
    '..#.#...#.#',
    '.#...##..#.',
    '..#.##.....',
    '.#.#.#....#',
    '.#........#',
    '#.##...#...',
    '#...##....#',
    '.#..#...#.#'
  ];
  group('Scenario One', () {
    test('example', () {
      expect(solve(map, [3, 1]), equals(7));
    });
    test('solution', () {
      int result = solve(data, [3, 1]);
      print('Your Answer: $result');

      expect(result, equals(214));
    });
  });

  group('Scenario Two', () {
    const List<List<int>> stepsList = [
      [1, 1],
      [3, 1],
      [5, 1],
      [7, 1],
      [1, 2],
    ];
    test('example', () {
      int total = 1;
      for (var steps in stepsList) {
        total *= solve(map, steps);
      }

      expect(total, equals(336));
    });

    test('solution', () {
      int total = 1;
      for (var steps in stepsList) {
        total *= solve(data, steps);
      }

      print('Your Answer: $total');
      expect(total, isNot(4823289504));
      expect(total, equals(8336352024));
    });
  });
}
