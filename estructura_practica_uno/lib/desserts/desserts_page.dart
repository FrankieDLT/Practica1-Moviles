import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  List<ProductItemCart> shoppingcart=[];
  DessertsPage({
    Key key,
    @required this.dessertsList, @required this.shoppingcart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres",style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),),
        backgroundColor: Color(0xFF214254),
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()  async{
              shoppingcart = await 
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>ItemDessertDetails(
                    shoppingCart: shoppingcart,
                    desserts: dessertsList.elementAt(index),
                  ),
              ),
              );
              Navigator.of(context).pop(shoppingcart);
            },
                      child: ItemDesserts(
              dessert: dessertsList[index],
            ),
          );
        },
      ),
    );
  }
}
