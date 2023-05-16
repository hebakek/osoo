import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/controller/home_controller.dart';

class TextFiledPage extends StatelessWidget {
  TextEditingController con;

  TextFiledPage(this.con);
  HomeController authController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: con,
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      enabled: true,
      onChanged: (value){
        authController.nameText.value =value;

      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: 'Enter Your Name',
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
