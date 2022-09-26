import 'package:flutter/material.dart';

class AppTextBold extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final bool center;
  const AppTextBold({Key? key,
    this.size = 37,
    required this.text,
    this.color = Colors.black, this.center = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
      textAlign: center == true ? TextAlign.center : TextAlign.left,
    );
  }
}
