import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  String title, valor, local;
  VoidCallback? onTap;

  CardItem({
    Key? key,
    required this.title,
    required this.valor,
    required this.local,
    this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(8),
        child: Column(children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              Icons.email,
              size: 30,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "BOLSA: " + valor,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "LOCAL: " + local,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "VER MAIS",
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
