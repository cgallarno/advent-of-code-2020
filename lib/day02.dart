int testPasswords(passwords, {officalPolicy = false}) {
  int validPws = 0;
  for (var p in passwords) {
    // print('testing $p');
    List<String> parts = p.split(': ');
    List<String> reqs = parts[0].split(' ');
    List<String> minMax = reqs[0].split('-');
    Iterable<int> password = parts[1].runes;

    int min = int.parse(minMax[0]);
    int letter = reqs[1].runes.single;
    int max = int.parse(minMax[1]);

    String debugLetter = reqs[1];
    String debugPassword = parts[1];
    // print('$debugLetter is between $min - $max in $debugPassword');

    if (officalPolicy) {
      int firstElement = password.elementAt(min - 1);
      int secondElement = password.elementAt(max - 1);
      if ((firstElement == letter && secondElement != letter) ||
          (secondElement == letter && firstElement != letter)) {
        validPws++;
      }
    } else {
      int countOfLetter = password.where((char) => char == letter).length;
      // print('letter occured $countOfLetter times');
      if (countOfLetter >= min && countOfLetter <= max) {
        validPws++;
      }
    }
  }

  return validPws;
}
