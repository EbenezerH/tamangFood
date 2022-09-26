import 'package:flutter/material.dart';
import 'is_mobile.dart';
import 'is_tablet.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  PageController controller = PageController();
  /*@override
  void initState(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: width <= 650 ? const IsMobile() : const IsTablet()
    );
  }
}
