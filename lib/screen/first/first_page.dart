import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/controller/home_controller.dart';
import 'package:osoo/model/color_model.dart';
import 'package:osoo/widget/button_widget.dart';
import 'package:osoo/widget/text_field_widget.dart';

import '../../utils/string/colors.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  HomeController authController = Get.put(HomeController());
  List<ColorModel> items = [
    ColorModel(0, blue, true),
    ColorModel(1, blueLight, false),
    ColorModel(2, pink, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Animations'),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25.0, 25, 25),
        child: Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height,
          child: ListView(shrinkWrap: true, children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Obx(() => authController.nameText.value == ''
                    ? Text('Your Name')
                    : Text(authController.nameText.value)),
                SizedBox(
                  height: 35,
                ),
                Obx(()=>

                authController.selectItem.value == 0
                    ?  AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: Get.width / 1.5,
                  height: Get.height / 2.5,
                  color: blue,
                )
                    : authController.selectItem.value == 1
                    ?  AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: Get.width / 1.5,
                  height: Get.height / 2.5,
                  decoration: BoxDecoration(
                      color: blueLight,
                      borderRadius: BorderRadius.circular(15)),
                )
                    :  AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: Get.width / 1.5,
                  height: Get.height / 2.5,
                  decoration: BoxDecoration(
                    color: pink,
                    shape: BoxShape.circle,
                  ),
                ),),
                SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        authController.selectItem.value = 0;
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: blue,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        authController.selectItem.value = 1;
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: blueLight,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        authController.selectItem.value = 2;
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: pink,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
