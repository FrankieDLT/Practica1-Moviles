import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

import '../payment.dart';

// ignore: must_be_immutable
class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grains;
  List<ProductItemCart> shoppingCart = [];

  ItemGrainsDetails({
    Key key,
    @required this.grains,
    @required this.shoppingCart,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  String tam = "med";
  bool lik = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle",style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),),
        backgroundColor: Color(0xFF214254),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    Container(
                      color: Color(0xFFFABF7C),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          setState(() {
                            lik = !lik;
                            print(lik);
                          });
                        },
                        color: lik ? Colors.cyan[400] : Colors.black,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          widget.grains.productImage,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 28, right: 180),
                  child: Text(
                    "${widget.grains.productTitle}",
                    style: TextStyle(fontSize: 20),
                  )),
              Text("${widget.grains.productDescription}"),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Tamaños Disponibles"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "med";
                                  // ignore: unnecessary_statements
                                  widget.grains.productWeight ==
                                      ProductWeight.CUARTO;
                                  widget.grains.productPrice =
                                      widget.grains.productPriceCalculator();
                                });
                              },
                              child: Container(
                                height: 24,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: tam == 'med'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("250G")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "kilo";
                                  // ignore: unnecessary_statements
                                  widget.grains.productWeight ==
                                      ProductWeight.KILO;
                                  widget.grains.productPrice =
                                      widget.grains.productPriceCalculator();
                                });
                              },
                              child: Container(
                                height: 24,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: tam == 'kilo'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("1 Kilo")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Precio"),
                        Text(
                          "\$${widget.grains.productPrice}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      ProductItemCart adder = new ProductItemCart(
                        productTitle: widget.grains.productTitle,
                        productAmount: widget.grains.productAmount,
                        productPrice: widget.grains.productPrice,
                        typeOfProduct: ProductType.GRANO,
                        productImage: widget.grains.productImage,
                        liked: widget.grains.liked,
                        productSize: null,
                        productWeight: widget.grains.productWeight,
                        productPortion: null,
                      );
                      widget.shoppingCart.add(adder);
                      //print(widget.shoppingCart[0].productTitle); //Print del nombre del producto
                      Navigator.of(context).pop(widget.shoppingCart);
                    },
                    child: Text("Agregar al Carrito"),
                    color: Color(0xFF8B8175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      ProductItemCart adder = new ProductItemCart(
                        productTitle: widget.grains.productTitle,
                        productAmount: widget.grains.productAmount,
                        productPrice: widget.grains.productPrice,
                        typeOfProduct: ProductType.GRANO,
                        productImage: widget.grains.productImage,
                        liked: widget.grains.liked,
                        productSize: null,
                        productWeight: widget.grains.productWeight,
                        productPortion: null,
                      );
                      widget.shoppingCart.add(adder);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Payment();
                          },
                        ),
                      );
                    },
                    color: Color(0xFF8B8175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text("Comprar Ahora"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
