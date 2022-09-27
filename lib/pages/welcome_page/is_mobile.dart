import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_bold.dart';
import '../../widgets/responsive_button.dart';
import '../carousel_page/carousel_page.dart';

class IsMobile extends StatelessWidget {
  const IsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(logo),
                  const SizedBox(width: 5,),
                  Column(
                    children: const [
                      AppTextBold(text: tamang),
                      AppTextBold(text: foodservice),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/img/$welcomeImage"
                            ),
                            fit: BoxFit.contain
                        )
                    )
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextBold(
                    text: firstText,
                    size: 30, center: true,
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText(text: secondeText, size: 14, color: AppColors.textColor2,)
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CarouselPage())
                    ),
                    child: Row(
                      children: const [
                        ResponsiveButton(width: double.maxFinite, text: "GET STARTED"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                ],
              )
            ],
          )
      ),
    );
  }
}
