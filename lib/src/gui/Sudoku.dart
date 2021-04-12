import 'package:flutter/material.dart';
import 'package:sudoku/src/models/Position.dart';
import 'package:sudoku/src/logic/GridUtils.dart';
import 'package:sudoku/src/Puzzle.dart';
import 'package:sudoku/src/gui/SudokuCell.dart';

class Sudoku extends StatefulWidget {
  final Puzzle sudoku;
  Sudoku({this.sudoku, Key key}) : super(key: key);

  @override
  _SudokuState createState() => _SudokuState(sudoku: sudoku);
}

class _SudokuState extends State<Sudoku> {
  Puzzle sudoku;
  List<Widget> cells = [];
  _SudokuState({this.sudoku});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: sudokuBoard(),
    );
  }

  Widget sudokuBoard() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        var data =
            sudoku.board().cellAt(Position(row: i, column: j)).getValue();
        var edit = data == 0;
        cells.add(SudokuCell(
          data: data,
          editable: edit,
        ));
      }
    }
    List<Widget> sections = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int index = 27 * i + 3 * j;
        sections.add(Table(
          border: TableBorder.all(color: Colors.grey),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                children: [cells[index], cells[index + 1], cells[index + 2]]),
            TableRow(children: [
              cells[index + 9],
              cells[index + 10],
              cells[index + 11]
            ]),
            TableRow(children: [
              cells[index + 18],
              cells[index + 19],
              cells[index + 20]
            ]),
          ],
        ));
      }
    }
    Table board = Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          TableCell(child: sections[0]),
          TableCell(child: sections[1]),
          TableCell(child: sections[2]),
        ]),
        TableRow(children: [
          TableCell(child: sections[3]),
          TableCell(child: sections[4]),
          TableCell(child: sections[5]),
        ]),
        TableRow(children: [
          TableCell(child: sections[6]),
          TableCell(child: sections[7]),
          TableCell(child: sections[8]),
        ]),
      ],
    );
    return SizedBox(width: 250, height: 250, child: board);
  }
}
