import 'package:osoo/model/pokemon_model.dart';

class PokemonResponse {
  final List<PokemonModel> items;
final int code;
  PokemonResponse(this.items,this.code);

  PokemonResponse.fromJson(Map<String, dynamic> json,int statusCode)
      : items = json["results"] != null
            ? List<PokemonModel>.from(
                json["results"].map((x) => PokemonModel.fromJson(x)))
            : [],
  code =statusCode;

  PokemonResponse.withError(Map<String, dynamic> json,int statusCode) : items = [],
  code=statusCode;
}
