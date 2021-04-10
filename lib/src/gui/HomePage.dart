import 'package:flutter/material.dart';
import 'package:sudoku/src/gui/NewGame.dart';

class HomePage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Center(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Continuar"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(
                onPressed: () => _newGame(context),
                child: Text("Nueva Partida"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Estadísticas"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Opciones"))),
        Divider(),
        Container(
            width: 250,
            color: Colors.black12,
            child: TextButton(onPressed: () {}, child: Text("Estilos"))),
      ],
    );
  }

  void _newGame(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewGame()));
  }
}
