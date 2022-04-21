import 'package:flutter/material.dart';

class InteresseListaView extends StatefulWidget {
  const InteresseListaView({Key? key}) : super(key: key);

  @override
  _InteresseListaViewState createState() => _InteresseListaViewState();
}

class _InteresseListaViewState extends State<InteresseListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interesses"),
      ),
    );
  }
}
