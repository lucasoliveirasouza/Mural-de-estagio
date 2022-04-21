import 'package:flutter/material.dart';

class EmpresaListaView extends StatefulWidget {
  const EmpresaListaView({Key? key}) : super(key: key);

  @override
  _EmpresaListaViewState createState() => _EmpresaListaViewState();
}

class _EmpresaListaViewState extends State<EmpresaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empresas"),
      ),
    );
  }
}
