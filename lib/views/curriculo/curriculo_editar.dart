

import 'package:flutter/material.dart';

class CurriculoEditarView extends StatefulWidget {
  const CurriculoEditarView({Key? key}) : super(key: key);

  @override
  _CurriculoEditarViewState createState() => _CurriculoEditarViewState();
}

class _CurriculoEditarViewState extends State<CurriculoEditarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currículo"
        ),
      ),
    );
  }
}
