import 'package:flutter/material.dart';
import '../../widgets/app_text.dart';
import '../../widgets/responsive_button.dart';
import '../login_page.dart';
import '../../constants/constants.dart';

import '../../widgets/app_text_bold.dart';

class IsTabletCarousel extends StatefulWidget {
  const IsTabletCarousel({Key? key}) : super(key: key);

  @override
  State<IsTabletCarousel> createState() => _IsTabletCarouselState();
}

class _IsTabletCarouselState extends State<IsTabletCarousel> {

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          allowImplicitScrolling: true,
          controller: controller,
          itemBuilder: (_, index){
            return Container(
              //color: Colors.grey.withOpacity(0.5),
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
                                            "assets/img/${images[index]}"
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
                                  text: texts_1[index],
                                  //color: AppColors.textColor2,
                                  size: 38, center: true,
                                ),
                                const SizedBox(height: 25,),
                                Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: AppText(text: secondeText, size: 18, color: AppColors.textColor2,)
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(images.length, (indexDots){
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                                      width: 10,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: index==indexDots? AppColors.slideMarkColor : AppColors.mainColor.withOpacity(0.3)
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: () {
                                    if(index +1 == images.length){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignInPage()));
                                    }else{
                                      setState(() {
                                        controller.animateToPage(index + 1, duration: const Duration(milliseconds: 500), curve: Curves.elasticOut);
                                      });
                                    }
                                  },
                                  child: const ResponsiveButton(
                                      size: 18,
                                      width: double.maxFinite, text: "GET STARTED"
                                  ),
                                ),
                                const SizedBox(height: 30,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            );
          }),
    );
  }
}
