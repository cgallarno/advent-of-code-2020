int solve(String data) {
  List<String> groups = data.trim().split('\n\n');
  var groupTotals = groups.map((group) {
    // List<String> answers = group.reduce()
    return group.replaceAll('\n', '').split('').toSet().length;
  }).toList();

  return groupTotals.reduce((prev, element) => prev + element);
}

int solve2(String data) {
  List<String> groups = data.trim().split('\n\n');
  var peoplebyGroup = groups.map((group) {
    return group.split('\n');
  }).toList();

  // print(peoplebyGroup);

  var groupTotals = peoplebyGroup.map((group) {
    var answers = group.join('').split('').toSet();

    int total = 0;

    answers.forEach((answer) {
      if (group.every((element) => element.contains(answer))) {
        total++;
      }
    });

    print('$group -> $total');

    return total;
    // var answers = group.replaceAll('\n', '').split('').toSet().length;
  }).toList();

  print(groupTotals);
  return groupTotals.reduce((prev, element) => prev + element);
}
