import 'package:flutter/material.dart';

class VagaListaView extends StatefulWidget {
  const VagaListaView({Key? key}) : super(key: key);

  @override
  _VagaListaViewState createState() => _VagaListaViewState();
}

class _VagaListaViewState extends State<VagaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de vagas"),
      ),
    );
  }
}
