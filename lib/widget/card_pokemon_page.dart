import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osoo/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  PokemonModel item;

  PokemonCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
              ]),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Icon(Icons.image)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text(item.name),
              )
            ],
          )),
    );
  }
}
