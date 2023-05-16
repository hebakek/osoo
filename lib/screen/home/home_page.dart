import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/controller/home_controller.dart';
import 'package:osoo/screen/first/first_page.dart';
import 'package:osoo/screen/seconde/seconde_page.dart';
import 'package:osoo/widget/button_widget.dart';
import 'package:osoo/widget/text_field_widget.dart';

import '../../utils/string/colors.dart';

class HomePAge extends StatefulWidget {
  HomePAge({Key? key}) : super(key: key);

  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  HomeController authController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 25.0, 25, 25),
          child: Container(
            color: Colors.white,
            width: Get.width,
            height: Get.height,
            child: ListView(shrinkWrap: true, children: [
              Column(
                children: [
                  TextFiledPage(authController.name),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => authController.nameText.value == ''
                      ? Text('Your Name')
                      : Text(authController.nameText.value))
                ],
              )
            ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25.0, 25, 25),
            child: Container(
              color: Colors.white,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                     onTap: (){
                       authController.name.text='';
                       authController.nameText.value='';
                     },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Clear Text',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    BtnPage('Go to page 1', openPageOne,blue),
                    SizedBox(height: 10,),
                    BtnPage('Go to page 2', openPageTwo,blueLight)
                  ]),
            ),
          ),
        )
      ]),
    );
  }
  openPageOne() {
  Get.to(() => FirstPage());
  }
  openPageTwo() {
      Get.to(() => SecondePage());
  }
}

