import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:osoo/screen/home/home_page.dart';
import 'package:osoo/utils/string/images.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo:Image.asset(logoImage) ,
      logoWidth: MediaQuery.of(context).size.width,
      backgroundColor: Colors.white,
      showLoader: true,
      loaderColor: Colors.white,
      navigator: HomePAge(),
      durationInSeconds: 3,
    );
  }
}
