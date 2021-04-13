import 'package:sudoku/src/gui/SudokuCell.dart';

class DataCells {
  static List<SudokuCell> cells = [];
  static int row, column;
  static bool notes = false;
  static void update(int r, int c) {
    row = r;
    column = c;
    print("selected: $r $c");
    for (var cell in cells) {
      if (cell.row == r && cell.column == c) {
        //print("Select $r $c");
        cell.select();
      } else {
        //print("deselect ${cell.row} ${cell.column}");
        cell.deSelect();
      }
    }
  }

  static write(int n) {
    print("wrote: $row $column n $n");
    for (var cell in cells) {
      if (cell.row == row && cell.column == column) {
        cell.write(n);
      }
    }
  }

  static delete() {
    print("delete: $row $column");
    for (var cell in cells) {
      if (cell.row == row && cell.column == column) {
        cell.delete();
      }
    }
  }
}
