import 'dart:convert';

class PokemonModel {
  String name;
  String url;

  PokemonModel({required this.url, required this.name});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'].toString(),
      url: json['url'],
    );
  }
}
