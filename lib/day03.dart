int solve(List<String> data, List<int> steps) {
  bool positionIsBlocked(x, y) {
    int width = data[y].length;

    int xPos = x;

    if (x > width - 1) {
      xPos = x % width;
    }
    print('Getting $x,$y mapped to $xPos,$y out of $width, ${data.length}');

    return data[y][xPos] == '#';
  }

  int x = 0;
  int y = 0;
  int totalTrees = 0;

  while (y < data.length) {
    if (positionIsBlocked(x, y)) {
      totalTrees++;
    }
    x += steps[0];
    y += steps[1];
  }

  return totalTrees;
}
