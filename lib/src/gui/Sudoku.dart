import 'package:flutter/material.dart';
import 'package:sudoku/src/models/Position.dart';
import 'package:sudoku/src/logic/DataCells.dart';
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
  _SudokuState({this.sudoku});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [sudokuBoard(), editOptions()],
      )),
    );
  }

  void fillSudokuCells() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        var data =
            sudoku.board().cellAt(Position(row: i, column: j)).getValue();
        var edit = data == 0;
        DataCells.cells.add(SudokuCell(
          row: i,
          column: j,
          data: data,
          editable: edit,
          key: GlobalKey<SudokuCellState>(),
        ));
      }
    }
  }

  List<Widget> makeSudokuSections() {
    List<Widget> sections = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int index = 27 * i + 3 * j;
        sections.add(Table(
          border: TableBorder.all(color: Colors.grey),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              DataCells.cells[index],
              DataCells.cells[index + 1],
              DataCells.cells[index + 2]
            ]),
            TableRow(children: [
              DataCells.cells[index + 9],
              DataCells.cells[index + 10],
              DataCells.cells[index + 11]
            ]),
            TableRow(children: [
              DataCells.cells[index + 18],
              DataCells.cells[index + 19],
              DataCells.cells[index + 20]
            ]),
          ],
        ));
      }
    }
    return sections;
  }

  Table fillTableSections(List<Widget> sections) {
    return Table(
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
  }

  Widget sudokuBoard() {
    fillSudokuCells();
    List<Widget> sections = makeSudokuSections();
    Table board = fillTableSections(sections);
    return SizedBox(width: 250, height: 250, child: board);
  }

  // ignore: avoid_init_to_null
  Widget editButton(String txt, method(), {Color color = null}) {
    if (color == null) {
      color = Colors.blue[100];
    }
    return Container(
        width: 20,
        height: 70,
        color: color,
        child: TextButton(onPressed: method, child: Text(txt)));
  }

  Widget editOptions() {
    List<Widget> nums = [];
    for (int i = 1; i <= 9; i++) {
      nums.add(editButton("$i", () {
        DataCells.write(i);
      }));
    }
    return SizedBox(
      width: 250,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: nums +
            <Widget>[
              editButton("?", () {
                DataCells.notes ^= true;
                print(DataCells.notes);
              }),
              editButton("X", DataCells.delete),
            ],
      ),
    );
  }
}
