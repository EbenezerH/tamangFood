import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamang_foodservice/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final double size;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons({Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.bgColor,
    required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor,
            width: 1.0
          ),
          borderRadius: BorderRadius.circular(15)
      ),
      child: isIcon==false?Center(child: AppText(text: text!, color: color,)):Center(child: Icon(icon, color: color,))
    );
  }
}
