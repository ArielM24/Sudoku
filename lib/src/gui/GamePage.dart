import 'package:flutter/material.dart';
import 'package:sudoku/src/Puzzle.dart';
import 'package:sudoku/src/models/PuzzleOptions.dart';
import 'package:sudoku/src/logic/GridUtils.dart';

class GamePage extends StatefulWidget {
  final int difficulty;
  GamePage(this.difficulty, {Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState(difficulty);
}

class _GamePageState extends State<GamePage> {
  int difficulty;
  Puzzle sudoku;
  _GamePageState(this.difficulty);
  @override
  void initState() {
    super.initState();
    var options = PuzzleOptions(patternName: "random");
    sudoku = Puzzle(options);
    sudoku.generate();
  }

  @override
  Widget build(BuildContext context) {
    String diff = "";
    switch (difficulty) {
      case 0:
        diff = "Fácil";
        break;
      case 1:
        diff = "Normal";
        break;
      case 2:
        diff = "Difícil";
        break;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        title: Text(diff),
        actions: [IconButton(icon: Icon(Icons.check), onPressed: () {})],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Text("${stringGrid(sudoku.board())}"),
    );
  }

  Widget sudokuBoard() {}
}
