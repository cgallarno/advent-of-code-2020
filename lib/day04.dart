import 'dart:math';

class Passport {
  static const List<String> eyeColors = [
    'amb',
    'blu',
    'brn',
    'gry',
    'grn',
    'hzl',
    'oth'
  ];
  static const List<String> requiredFields = [
    'byr',
    'iyr',
    'eyr',
    'hgt',
    'hcl',
    'ecl',
    'pid'
  ];
  //'cid' ]

  int _birthYear;
  int _issueYear;
  int _expirationYear;
  int _heightValue;
  String _heightUnit;
  String _hairColor;
  String _eyeColor;
  String _passportId;
  String countryId;

  String get birthYear => _birthYear != null ? _birthYear.toString() : null;
  void set birthYear(String value) {
    int year = int.tryParse(value);
    if (year != null && year >= 1920 && year <= 2002) {
      _birthYear = year;
    } else {
      // print('    value($value) not valid for birthYear');
    }
  }

  String get issueYear => _issueYear != null ? _issueYear.toString() : null;
  void set issueYear(String value) {
    int year = int.tryParse(value);

    if (year != null && year >= 2010 && year <= 2020) {
      _issueYear = year;
    } else {
      //print('value($value) not valid for issueYear');
    }
  }

  String get expirationYear =>
      _expirationYear != null ? _expirationYear.toString() : null;
  void set expirationYear(String value) {
    int year = int.tryParse(value);

    if (year != null && year >= 2020 && year <= 2030) {
      _expirationYear = year;
    } else {
      //print('value($value) not valid for expirationYear');
    }
  }

  String get height => _heightValue != null && _heightUnit != null
      ? '$_heightValue$_heightUnit'
      : null;

  void set height(String value) {
    RegExpMatch unitValue = new RegExp(r'[cm|in]$').firstMatch(value);
    if (unitValue == null) return;
    String unit = value.substring(unitValue.start - 1, unitValue.end);
    int parsedValue = int.tryParse(value.substring(0, unitValue.start - 1));

    if (unit != null && parsedValue != null) {
      bool isValidCm = unit == 'cm' && parsedValue >= 150 && parsedValue <= 193;
      bool isValidIn = unit == 'in' && parsedValue >= 59 && parsedValue <= 76;
      if (isValidIn || isValidCm) {
        _heightUnit = unit;
        _heightValue = parsedValue;
      }
    }
  }

  String get hairColor => _hairColor;
  void set hairColor(String value) {
    RegExp colorPattern = new RegExp(r'^#(?:[0-9a-fA-F]{6})$');

    if (colorPattern.hasMatch(value)) {
      _hairColor = value;
    } else {
      //print('value($value) not valid for hairColor');
    }
  }

  String get eyeColor => _eyeColor;
  void set eyeColor(String value) {
    if (eyeColors.contains(value)) {
      _eyeColor = value;
    } else {
      //print('value($value) not valid for eyeColor');
    }
  }

  String get passportId => _passportId;
  void set passportId(String value) {
    RegExp idPattern = new RegExp(r'^[\d]{9}$');
    if (idPattern.hasMatch(value)) {
      _passportId = value;
    } else {
      //print('value($value) not valid for passportId');
    }
  }

  Map<String, String> data;

  Passport(String fields) {
    List<List<String>> keyValues = fields
        .trim()
        .split(' ')
        .map((keyValue) => keyValue.split(':'))
        .toList();

    data = Map.fromIterable(keyValues,
        key: (item) => item[0], value: (item) => item[1]);

    for (var field in requiredFields) {
      data.putIfAbsent(field, () => '');
    }

    birthYear = data['byr'];
    issueYear = data['iyr'];
    expirationYear = data['eyr'];
    height = data['hgt'];
    hairColor = data['hcl'];
    eyeColor = data['ecl'];
    passportId = data['pid'];
    countryId = data['cid'];
  }

  bool validate() {
    if (passportId == '012533040') {
      //print('-> $expirationYear, $eyeColor');
    }
    return notNull(birthYear) &&
        notNull(issueYear) &&
        notNull(expirationYear) &&
        notNull(height) &&
        notNull(hairColor) &&
        notNull(eyeColor) &&
        notNull(passportId);
  }

  bool notNull(value) {
    // print('checking null for $value');
    return value != null && value != '' && value != 'null';
  }
}

int solve(List<String> passportData) {
  List<Passport> passports = [];

  String currentPassportData = '';
  for (var data in passportData) {
    if (data == '') {
      passports.add(new Passport(currentPassportData));
      currentPassportData = '';
    } else {
      currentPassportData += ' $data';
    }
  }

  passports.add(new Passport(currentPassportData));

  Iterable<Passport> validPassports =
      passports.where((passport) => passport.validate());

  return validPassports.length;
}
