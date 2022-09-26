import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_bold.dart';
import '../../widgets/responsive_button.dart';
import '../carousel_page/carousel_page.dart';

class IsTablet extends StatelessWidget {
  const IsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      Container(
        //color: Colors.grey.withOpacity(0.5),
          height: height, width: width,
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(logo),
                  const SizedBox(width: 10,),
                  const AppTextBold(size:40, text: tamang+foodservice),
                ],
              ),

              SizedBox(
                width: double.maxFinite, height: height-130,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          width: double.maxFinite, height: double.maxFinite,
                          margin: const EdgeInsets.only(bottom: 10),
                          //width: 350, height: 350,
                          decoration: BoxDecoration(
                            //color: Colors.blue.withOpacity(0.5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/img/$welcomeImage"
                                  ),
                                  fit: BoxFit.contain
                              )
                          )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppTextBold(
                            text: firstText,
                            //color: AppColors.textColor2,
                            size: 38, center: true,
                          ),
                          const SizedBox(height: 40,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: AppText(text: secondeText, size: 18, color: AppColors.textColor2,)
                          ),
                          const SizedBox(height: 40,),

                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const CarouselPage())
                            ),
                            child: Row(
                              children: const [
                                ResponsiveButton(
                                  size: 18,
                                    width: double.maxFinite, text: "GET STARTED"
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
