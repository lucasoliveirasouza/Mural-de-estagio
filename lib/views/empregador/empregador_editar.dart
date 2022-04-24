
import 'package:flutter/material.dart';

class EmpregadorEditarView extends StatefulWidget {
  const EmpregadorEditarView({Key? key}) : super(key: key);

  @override
  _EmpregadorEditarViewState createState() => _EmpregadorEditarViewState();
}

class _EmpregadorEditarViewState extends State<EmpregadorEditarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar empregador"),
      ),
    );
  }
}
