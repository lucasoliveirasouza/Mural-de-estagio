import 'package:flutter/material.dart';
import 'package:mural_estagio/util/constantes.dart';

class LinhaTabela extends StatelessWidget {
  String title;
  String valor;

  LinhaTabela({
    Key? key,
    required this.valor,
    required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Table(
        children: [
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(
                right: 5,
                top: 7,
                bottom: 7,
              ),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              color: corPadrao,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                valor,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: corPadrao,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
