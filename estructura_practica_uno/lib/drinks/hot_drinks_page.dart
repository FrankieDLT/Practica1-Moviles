import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

// ignore: must_be_immutable
class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  List<ProductItemCart> shoppingcart=[];
  HotDrinksPage({
    Key key,
    @required this.drinksList, @required this.shoppingcart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas",style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),),
        backgroundColor: Color(0xFF214254),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
               shoppingcart = await
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>ItemHotDrinksDetails(
                    shoppingCart: shoppingcart,
                    drinks: drinksList.elementAt(index),
                  ),
              ),
              );
              Navigator.of(context).pop(shoppingcart);
            },
                      child: ItemHotDrinks(
              drink: drinksList[index],
            ),
          );
        },
      ),
    );
  }
}
