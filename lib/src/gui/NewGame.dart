import 'package:flutter/material.dart';
import 'package:sudoku/src/gui/GamePage.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dificultad"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Fácil"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(
                onPressed: () => _normal(context), child: Text("Normal"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Difícil"))),
        Divider(),
      ],
    );
  }

  void _normal(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GamePage(1)));
  }
}
