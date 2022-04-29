
import 'package:flutter/material.dart';

class InteressadoListaView extends StatefulWidget {
  const InteressadoListaView({Key? key}) : super(key: key);

  @override
  _InteressadoListaViewState createState() => _InteressadoListaViewState();
}

class _InteressadoListaViewState extends State<InteressadoListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interessados"),
      ),
    );
  }
}
