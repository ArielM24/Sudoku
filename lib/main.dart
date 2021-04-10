import 'package:flutter/material.dart';
import 'package:sudoku/src/models/PuzzleOptions.dart';
import 'package:sudoku/src/models/Position.dart';
import 'package:sudoku/src/logic/GridUtils.dart';
import 'package:sudoku/src/Puzzle.dart';
import 'package:sudoku/src/gui/HomePage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
