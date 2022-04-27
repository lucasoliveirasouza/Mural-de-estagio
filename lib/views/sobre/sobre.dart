import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Container(
        color: Colors.deepPurple.shade50,
        padding: EdgeInsets.only(top: 150),
        child: ListView(
          children: [
            SizedBox(
              height: 120,
              width: 150,
              child: Image.asset("assets/images/diplomado.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Mural de estágios",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Desenvolvido por Lucas Oliveira",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
