import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  List<ProductItemCart> shoppingcart=[];
  GrainsPage({
    Key key,
    @required this.grainsList, @required this.shoppingcart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos",style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),),
        backgroundColor: Color(0xFF214254),
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async{
              shoppingcart = await 
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>ItemGrainsDetails(
                    shoppingCart: shoppingcart,
                    grains: grainsList.elementAt(index),
                  ),
              ),
              );
              Navigator.of(context).pop(shoppingcart);
            },
                      child: ItemGrains(
              grain: grainsList[index],
            ),
          );
        },
      ),
    );
  }
}
