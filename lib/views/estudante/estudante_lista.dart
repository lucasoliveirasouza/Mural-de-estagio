
import 'package:flutter/material.dart';

class EstudanteListaView extends StatefulWidget {
  const EstudanteListaView({Key? key}) : super(key: key);

  @override
  _EstudanteListaViewState createState() => _EstudanteListaViewState();
}

class _EstudanteListaViewState extends State<EstudanteListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Lista de ")
      ),
    );
  }
}
