import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      height: MediaQuery.of(context).size.height / 3,
      color: Color(0xFFBCB0A1),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 115,
            right: 10,
            top: 0,
            bottom: 0,
          ),
          child: Image.network(
            widget.drink.productImage,
            width: 200,
            height: 200,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            child: Text("Café",
                style: TextStyle(fontSize: 15))),
        Padding(
            padding: const EdgeInsets.only(
              top: 55,
              left: 10,
            ),
            child: Container(
                width: 110, child: Text("${widget.drink.productTitle}",
                style: TextStyle(fontSize: 20,color: Colors.white)))),
        Padding(
            padding: const EdgeInsets.only(
              top: 150,
              bottom: 0,
              left: 10,
            ),
            child: Text("\$${widget.drink.productPrice}",
                style: TextStyle(fontSize: 23))),
        Padding(
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 1000,
            left: 260,
          ),
          child: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
