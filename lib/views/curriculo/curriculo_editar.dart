

import 'package:flutter/material.dart';
import 'package:mural_estagio/models/estudante.dart';

class CurriculoEditarView extends StatefulWidget {
  Estudante? estudante;
  CurriculoEditarView({Key? key, required this.estudante}) : super(key: key);

  @override
  _CurriculoEditarViewState createState() => _CurriculoEditarViewState();
}

class _CurriculoEditarViewState extends State<CurriculoEditarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.estudante?.nome ?? ""
        ),
      ),
      body: Container(

      ),
    );
  }
}
