import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import 'package:aoc2020/day04.dart';

const String dataFilePath = './data/day04.txt';

void main() {
  List<String> data = File(dataFilePath).readAsLinesSync();
  // String datcleara = File(dataFilePath).readAsStringSync();

  List<String> sampleData = [
    'ecl:gry pid:860033327 eyr:2020 hcl:#fffffd',
    'byr:1937 iyr:2017 cid:147 hgt:183cm',
    '',
    'iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884',
    'hcl:#cfa07d byr:1929',
    '',
    'hcl:#ae17e1 iyr:2013',
    'eyr:2024',
    'ecl:brn pid:760753108 byr:1931',
    'hgt:179cm',
    '',
    'hcl:#cfa07d eyr:2025 pid:166559648',
    'iyr:2011 ecl:brn hgt:59in',
  ];

  group('Scenario One', () {
    test('example', () {
      expect(solve(sampleData), equals(2));
    });
    test('solution', () {
      int result = solve(data);
      print('Your Answer: $result');

      expect(result, equals(170));
    });
  });

  group('Passport Model', () {
    test('birthYear', () {
      Passport ps1 = new Passport('byr:2002');
      Passport ps2 = new Passport('byr:2003');
      expect(ps1.birthYear, equals('2002'));
      expect(ps2.birthYear, equals(null));
    });

    test('issueYear', () {
      Passport ps1 = new Passport('iyr:2010');
      Passport ps2 = new Passport('iyr:2021');
      expect(ps1.issueYear, equals('2010'));
      expect(ps2.issueYear, equals(null));
    });

    test('expirationYear', () {
      Passport ps1 = new Passport('eyr:2025');
      Passport ps2 = new Passport('eyr:2035');
      expect(ps1.expirationYear, equals('2025'));
      expect(ps2.expirationYear, equals(null));
    });

    test('height', () {
      Passport ps1 = new Passport('hgt:60in');
      Passport ps2 = new Passport('hgt:190cm');

      Passport ps3 = new Passport('hgt:190in');
      Passport ps4 = new Passport('hgt:190');

      expect(ps1.height, equals('60in'));
      expect(ps2.height, equals('190cm'));

      expect(ps3.height, equals(null));
      expect(ps4.height, equals(null));
    });

    test('hairColor', () {
      Passport ps1 = new Passport('hcl:#123abc');
      Passport ps2 = new Passport('hcl:#123abz');
      Passport ps3 = new Passport('hcl:123abc');

      expect(ps1.hairColor, equals('#123abc'));
      expect(ps2.hairColor, equals(null));
      expect(ps3.hairColor, equals(null));
    });

    test('eyeColor', () {
      Passport ps1 = new Passport('ecl:brn');
      Passport ps2 = new Passport('ecl:wat');
      expect(ps1.eyeColor, equals('brn'));
      expect(ps2.eyeColor, equals(null));
    });

    test('passportId', () {
      Passport ps1 = new Passport('pid:000000001');
      Passport ps2 = new Passport('pid:0123456789');
      expect(ps1.passportId, equals('000000001'));
      expect(ps2.passportId, equals(null));
    });
  });

  group('Scenario Two', () {
    List<String> invalidPassports = [
      'eyr:1972 cid:100',
      'hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926',
      '',
      'iyr:2019',
      'hcl:#602927 eyr:1976 hgt:170cm',
      'ecl:grn pid:012533040 byr:1946',
      '',
      'hcl:dab227 iyr:2012',
      'ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277',
      '',
      'hgt:59cm ecl:zzz',
      'eyr:2038 hcl:74454a iyr:2023',
      'pid:3556412378 byr:2007'
    ];

    List<String> validPassports = [
      'pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980',
      'hcl:#623a2f',
      '',
      'eyr:2029 ecl:blu cid:129 byr:1989',
      'iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm',
      '',
      'hcl:#888785',
      'hgt:164cm byr:2001 iyr:2015 cid:88',
      'pid:545766238 ecl:hzl',
      'eyr:2022',
    ];
    test('all valid', () {
      expect(solve(validPassports), equals(3));
    });

    test('all invalid', () {
      expect(solve(invalidPassports), equals(0));
    });

    test('solution', () {
      int result = solve(data);
      print('Your Answer: $result');

      expect(result, isNot(111)); // too high
      expect(result, equals(103));
    });
  });
}
