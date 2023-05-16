import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnPage extends StatelessWidget {
  String title;
  VoidCallback callback;
  Color colorBtn;

  BtnPage(this.title, this.callback,this.colorBtn);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:  InkWell(
        onTap: callback,
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: colorBtn),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text(title, textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),),
          ),
        ),
      ),

    );
  }
}
