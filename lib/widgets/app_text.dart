import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppText({Key? key,
    this.size = 14,
    required this.text,
    this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text, textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: size,
        )
    );
  }
}
