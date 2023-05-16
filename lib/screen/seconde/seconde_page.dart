import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/controller/home_controller.dart';
import 'package:osoo/widget/card_pokemon_page.dart';

class SecondePage extends StatefulWidget {
  SecondePage({Key? key}) : super(key: key);

  @override
  _SecondePageState createState() => _SecondePageState();
}

class _SecondePageState extends State<SecondePage> {
  HomeController authController = Get.put(HomeController());
@override
  void initState() {
    // TODO: implement initState
    authController.getPokemonList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pokemons'),
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
          child: Obx(() => authController.isLoading.value == false
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return PokemonCard(authController.pokenmonList[index]);
                  },
                  itemCount: authController.pokenmonList.length,
                  shrinkWrap: true,
                )),
        ),
      ),
    );
  }
}
