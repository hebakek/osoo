import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/apo_provider/home_api_provider.dart';
import 'package:osoo/response/pokemon_response.dart';

class HomeController extends GetxController {
  TextEditingController name = TextEditingController();
  var nameText = ''.obs;
  var selectItem = 0.obs;
  var isLoading = false.obs;
  var pokenmonList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getPokemonList(BuildContext context) async {
    try {
      isLoading(false);
      pokenmonList.clear();

      PokemonResponse result = await HomeApiProvider().getPokemonList();

      if (result.code == 200) {
        pokenmonList.clear();

        pokenmonList.addAll(result.items);

        isLoading(true);
      } else {
        isLoading(true);
      }
    } finally {
      isLoading(true);

      update();
    }
  }
}
