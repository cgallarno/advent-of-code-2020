int solve(List<String> data) {
  List<Seat> seats = data.map((pass) => getSeatFromPass(pass)).toList();
  seats.sort((x, y) => y.id.compareTo(x.id));

  // print(seats.map((seat) => seat.id));
  return seats.first.id;
}

int solve2(List<String> passes) {
  List<Seat> seats = passes.map((pass) => getSeatFromPass(pass)).toList();
  seats.sort((x, y) => y.id.compareTo(x.id));

  List<bool> realSeats = List.filled(solve(passes) + 1, false);

  for (Seat seat in seats) {
    realSeats[seat.id] = true;
  }

  int i = 0;
  while (i < realSeats.length) {
    if (!realSeats[i]) {
      print('seat $i is empty');
    }
    i++;
  }
}

class Seat extends Object {
  int row;
  int column;

  int get id {
    return row * 8 + column;
  }

  Seat({this.row, this.column});

  bool operator ==(Object otherSeat) {
    return otherSeat is Seat &&
        this.row == otherSeat.row &&
        this.column == otherSeat.column &&
        this.id == otherSeat.id;
  }

  int get hashCode {
    return int.parse('$row$column$id');
  }

  @override
  String toString() => '{ row: $row, column: $column, id: $id }';
}

Seat getSeatFromPass(String pass) {
  List<String> rowBinary = pass.substring(0, 7).split('');
  List<String> colBinary = pass.substring(7, 10).split('');
  // print('row $rowBinary : col $colBinary');

  int row;
  List<int> range = [0, 127];
  for (String binaryPos in rowBinary) {
    int rangeDelta = ((range[1] - range[0]) / 2).round();

    if (binaryPos == 'F') {
      range[1] -= rangeDelta;
    } else {
      range[0] += rangeDelta;
    }

    row = range.first;
    // print('$binaryPos -> new range: $range');
  }

  int column;
  List<int> colRange = [0, 7];
  for (String binaryPos in colBinary) {
    int colRangeDelta = ((colRange[1] - colRange[0]) / 2).round();

    if (binaryPos == 'L') {
      colRange[1] -= colRangeDelta;
    } else {
      colRange[0] += colRangeDelta;
    }

    column = colRange.first;
    // print('$binaryPos -> new range: $range');
  }

  final seat = new Seat(column: column, row: row);

  // print(seat);
  return seat;
}
