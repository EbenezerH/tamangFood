import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:tamang_foodservice/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final double? width;
  final String text;
  final double? size;
   const ResponsiveButton({Key? key,
    this.width = 120, required this.text, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.buttonBackground,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
                child: AppText(text: text, color: AppColors.textButtonColor,
                  size: size!,

                )),
            //Image.asset("img/button-one.png")
          ],
        ),
      ),
    );
  }
}
