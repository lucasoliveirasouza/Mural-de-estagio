import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  String titulo;
  VoidCallback? onTap;

  BotaoPadrao({
    Key? key,
    required this.titulo,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 60, right: 60),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          titulo,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}