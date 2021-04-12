import 'package:flutter/material.dart';

class SudokuCell extends StatefulWidget {
  final int data;
  final bool editable;
  SudokuCell({this.data, this.editable, Key key}) : super(key: key);

  @override
  _SudokuCellState createState() =>
      _SudokuCellState(data: data, editable: editable);
}

class _SudokuCellState extends State<SudokuCell> {
  int r, c, data;
  Color background = Colors.white;
  bool editable;
  bool editing;
  _SudokuCellState({this.data, this.editable});
  @override
  Widget build(BuildContext context) {
    String clue = data == 0 ? "" : "$data";
    return Container(
      width: 25,
      height: 25,
      color: background,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print(editable);
          select();
        },
        child: Center(
          child: Text(clue),
        ),
      ),
    );
  }

  void select() {
    if (editable) {
      setState(() {
        background = Colors.blue[200];
      });
    }
  }

  void deSelect() {
    setState(() {
      background = Colors.white;
    });
  }
}
