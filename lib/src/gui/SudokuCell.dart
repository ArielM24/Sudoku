import 'package:flutter/material.dart';
import 'package:sudoku/src/logic/DataCells.dart';

class SudokuCell extends StatefulWidget {
  final int data;
  final int row, column;
  final bool editable;
  final GlobalKey<SudokuCellState> key;
  SudokuCell({this.row, this.column, this.data, this.editable, this.key})
      : super(key: key);

  @override
  SudokuCellState createState() =>
      SudokuCellState(row: row, column: column, data: data, editable: editable);
  select() {
    key.currentState.select();
  }

  deSelect() {
    key.currentState.deSelect();
  }

  write(int n) {
    key.currentState.write(n);
  }

  delete() {
    key.currentState.delete();
  }
}

class SudokuCellState extends State<SudokuCell> {
  int row, column, data;
  Color background = Colors.white;
  bool editable, hasData = false, editing;
  String content, notes;
  List<int> notesData = List<int>.generate(9, (_) => 0);
  Widget child;
  GlobalKey<SudokuCellState> key;
  TextStyle style = TextStyle(fontWeight: FontWeight.normal, fontSize: 15);
  SudokuCellState({this.row, this.column, this.data, this.editable, this.key});
  @override
  Widget build(BuildContext context) {
    hasData = data != 0;
    content = data == 0 ? "" : "$data";
    content = hasNotes() && !hasData ? strNotes() : content;
    print("editable $editable");
    if (!editable) {
      style = TextStyle(fontWeight: FontWeight.bold);
    }
    child = Text(
      "$content",
      style: style,
    );
    print("content $content");

    return Container(
      width: 25,
      height: 25,
      color: background,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          DataCells.update(row, column);
        },
        child: Center(
          child: child,
        ),
      ),
    );
  }

  void select() {
    if (editable) {
      setState(() {
        background = Colors.blue[200];
        editing = true;
      });
    } else {
      setState(() {
        background = Colors.blueGrey[300];
        editing = true;
      });
    }
  }

  void deSelect() {
    setState(() {
      background = Colors.white;
      editing = false;
    });
  }

  void write(int n) {
    print("write $n");
    if (editable && editing) {
      if (!DataCells.notes) {
        print("writing $n");
        setState(() {
          data = n;
          hasData = true;
          style = TextStyle(fontSize: 15);
          //print("state $content");
        });
      } else if (!hasData) {
        note(n);
      }
    }
  }

  void delete() {
    setState(() {
      if (editable && editing) {
        if (hasData) {
          data = 0;
          hasData = false;
          if (hasNotes()) {
            content = strNotes();
            style = TextStyle(fontSize: 7, fontWeight: FontWeight.bold);
          }
        } else if (hasNotes()) {
          notesData = List<int>.generate(9, (_) => 0);
          TextStyle style =
              TextStyle(fontWeight: FontWeight.normal, fontSize: 15);
        }
      }
    });
  }

  bool hasNotes() {
    for (var note in notesData) {
      if (note != 0) {
        return true;
      }
    }
    return false;
  }

  void note(int n) {
    print("noting $n");
    if (notesData[n - 1] == 0) {
      notesData[n - 1] = n;
    } else {
      notesData[n - 1] = 0;
    }
    style = TextStyle(fontSize: 7, fontWeight: FontWeight.bold);
    setState(() {
      content = strNotes();
      print("noted $content");
    });
  }

  String strNotes() {
    String str = "";
    for (int i = 1; i <= 9; i++) {
      int note = notesData[i - 1];
      str += note == 0 ? "  " : "$note";
      if (i % 3 == 0) {
        str += '\n';
      } else {
        str += " ";
      }
    }
    return str;
  }
}
