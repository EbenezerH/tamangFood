import 'package:flutter/material.dart';
import '../login_page.dart';
import '../../widgets/app_text_bold.dart';
import '../../widgets/app_text.dart';
import '../../widgets/responsive_button.dart';
import '../../constants/constants.dart';
import 'is_tablet_carousel.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

int? actualList;
class _CarouselPageState extends State<CarouselPage> {

  PageController controller = PageController();
  /*@override
  void dispose(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return width <= 650 ? Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          allowImplicitScrolling: true,
          controller: controller,
          itemBuilder: (_, index){
            return Container(
              //color: Colors.grey.withOpacity(0.5),
                margin: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "assets/img/"+ images[index]
                                      ),
                                      fit: BoxFit.contain
                                  )
                              )
                          ),
                        ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: AppTextBold(
                            text: texts_1[index],
                            //color: AppColors.textColor2,
                            size: 30, center: true,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                            //height: 100,
                            child: AppText(text: texts_2[index], size: 14, color: AppColors.textColor2,)
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (indexDots){
                            actualList = indexDots;
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
                          onTap: (){
                            if(index +1 == images.length){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignInPage()));
                            }else{
                              setState(() {
                                controller.animateToPage(index + 1, duration: const Duration(milliseconds: 500), curve: Curves.elasticOut);
                              });
                            }
                          },
                          child: SizedBox(
                              child: Row(
                                children: const [
                                  ResponsiveButton(width: double.maxFinite, text: "GET STARTED"),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                )
            );
          }),
    ): const IsTabletCarousel();
  }
}
