import 'dart:io';
import 'package:test/test.dart';
import 'package:aoc2020/day05.dart';

const String dataFilePath = './data/day05.txt';

final sampleData = ['FBFBBFFRLR', 'BFFFBBFRRR', 'FFFBBBFRRR', 'BBFFBBFRLL'];
void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();

  group('Scenario One', () {
    test('equality', () {
      expect(new Seat(row: 1, column: 2), equals(new Seat(row: 1, column: 2)));
    });
    test('can determine row and column', () {
      expect(
          getSeatFromPass(sampleData[0]), equals(new Seat(row: 44, column: 5)));

      final Seat seat2 = getSeatFromPass(sampleData[1]);
      assert(seat2 == new Seat(row: 70, column: 7), seat2.toString());

      expect(
          getSeatFromPass(sampleData[2]), equals(new Seat(row: 14, column: 7)));

      expect(getSeatFromPass(sampleData[3]),
          equals(new Seat(row: 102, column: 4)));
    });

    test('calculates id correctly', () {
      expect(new Seat(row: 10, column: 5).id, equals(85));
    });

    test('example', () {
      // Get the highest id
      final result = solve(sampleData);
      expect(result, isNot(null));
      expect(result, equals(820));
    });

    test('answer', () {
      int result = solve(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
      expect(result, equals(878));
    });
  });

  group('Scenario Two', () {
    test('example', () {
      final result = solve2(sampleData);
      expect(result, isNot(null));
    });

    test('answer', () {
      int result = solve2(data);
      print('Your Answer: $result');
      expect(result, isNot(null));
    });
  });
}
