import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

import '../payment.dart';

// ignore: must_be_immutable
class ItemDessertDetails extends StatefulWidget {
  final ProductDesserts desserts;
  List<ProductItemCart> shoppingCart=[];
  
  ItemDessertDetails({
    Key key,
    @required this.desserts, @required this.shoppingCart,
  }) : super(key: key);

  @override
  _ItemDessertDetailsState createState() => _ItemDessertDetailsState();
}

class _ItemDessertDetailsState extends State<ItemDessertDetails> {
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
          padding: const EdgeInsets.all(24),
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
                          widget.desserts.productImage,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: Text("${widget.desserts.productTitle}")),
              Text("${widget.desserts.productDescription}"),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Porciones Disponibles"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "med";
                                  widget.desserts.productPortion = ProductPortion.MEDIA;
                                  widget.desserts.productPrice =  widget.desserts.productPriceCalculator();
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
                                child: Center(child: Text("Media")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "ent";
                                  widget.desserts.productPortion = ProductPortion.ENTERA;
                                  widget.desserts.productPrice =  widget.desserts.productPriceCalculator();
                                });
                              },
                                                          child: Container(
                                height: 24,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: tam == 'ent'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("Entera")),
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
                          "\$${widget.desserts.productPrice}",
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
                        productTitle: widget.desserts.productTitle, 
                        productAmount: widget.desserts.productAmount, 
                        productPrice: widget.desserts.productPrice,
                        typeOfProduct: ProductType.POSTRES, 
                        productImage: widget.desserts.productImage,
                        liked: widget.desserts.liked, 
                        productSize: null,
                        productWeight:  null,
                        productPortion: widget.desserts.productPortion,);
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
                        productTitle: widget.desserts.productTitle, 
                        productAmount: widget.desserts.productAmount, 
                        productPrice: widget.desserts.productPrice,
                        typeOfProduct: ProductType.POSTRES, 
                        productImage: widget.desserts.productImage,
                        liked: widget.desserts.liked, 
                        productSize: null,
                        productWeight:  null,
                        productPortion: widget.desserts.productPortion,);
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
/*
 decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFBCB0A1)
                                  ])),
*/
