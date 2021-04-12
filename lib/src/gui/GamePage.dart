import 'package:flutter/material.dart';
import 'package:sudoku/src/Puzzle.dart';
import 'package:sudoku/src/models/PuzzleOptions.dart';
import 'package:sudoku/src/gui/Sudoku.dart';

class GamePage extends StatefulWidget {
  final int difficulty;
  GamePage(this.difficulty, {Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState(difficulty);
}

class _GamePageState extends State<GamePage> {
  int difficulty;
  Puzzle sudoku;
  bool generated = false;
  Future<bool> boardGenerated;
  _GamePageState(this.difficulty);
  @override
  void initState() {
    super.initState();
    if (!generated) {
      var options = PuzzleOptions(patternName: "random");
      sudoku = Puzzle(options);
      generated = true;
      boardGenerated = sudoku.generate();
    }
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
    return FutureBuilder(
        future: boardGenerated,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = Sudoku(
              sudoku: sudoku,
            );
          } else if (snapshot.hasError) {
            child = Text("Error");
          } else {
            child = SizedBox(
              width: 60,
              height: 60,
              child: Center(child: CircularProgressIndicator()),
            );
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
            body: child,
          );
        });
  }
}
