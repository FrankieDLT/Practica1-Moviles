import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
            widget.grain.productImage,
            width: 200,
            height: 200,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            child: Text("Grano",
                style: TextStyle(fontSize: 15))),
        Padding(
            padding: const EdgeInsets.only(
              top: 55,
              left: 10,
            ),
            child: Container(
                width: 110, child: Text("${widget.grain.productTitle}",
                style: TextStyle(fontSize: 20,color: Colors.white)))),
        Padding(
            padding: const EdgeInsets.only(
              top: 150,
              bottom: 0,
              left: 10,
            ),
            child: Text("\$${widget.grain.productPrice}",
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
