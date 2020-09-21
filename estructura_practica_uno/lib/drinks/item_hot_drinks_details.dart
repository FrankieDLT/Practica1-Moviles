import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks drinks;
  List<ProductItemCart> shoppingCart = [];

  ItemHotDrinksDetails({
    Key key,
    @required this.drinks,
    @required this.shoppingCart,
  }) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  String tam = "chi";
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
                          widget.drinks.productImage,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 28, right: 200),
                  child: Text(
                    "${widget.drinks.productTitle}",
                    style: TextStyle(fontSize: 20),
                  )),
              Text("${widget.drinks.productDescription}"),
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
                                  tam = "chi";
                                  widget.drinks.productSize = ProductSize.CH;
                                  widget.drinks.productPrice = widget.drinks.productPriceCalculator();
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: tam == 'chi'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("Chico")),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "med";
                                  widget.drinks.productSize = ProductSize.M;
                                  widget.drinks.productPrice = widget.drinks.productPriceCalculator();
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: tam == 'med'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("Mediano")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tam = "gra";
                                  widget.drinks.productSize = ProductSize.G;
                                  widget.drinks.productPrice = widget.drinks.productPriceCalculator();
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: tam == 'gra'
                                          ? Color(0xFF121B22)
                                          : Color(0xFFBCB0A1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text("Grande",style: TextStyle(fontSize: 13),)),
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
                          "\$${widget.drinks.productPrice}",
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
                        productTitle: widget.drinks.productTitle,
                        productAmount: widget.drinks.productAmount,
                        productPrice: widget.drinks.productPrice,
                        typeOfProduct: ProductType.BEBIDAS,
                        productImage: widget.drinks.productImage,
                        liked: widget.drinks.liked,
                        productSize: widget.drinks.productSize,
                        productWeight: null,
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
                        productTitle: widget.drinks.productTitle,
                        productAmount: widget.drinks.productAmount,
                        productPrice: widget.drinks.productPrice,
                        typeOfProduct: ProductType.BEBIDAS,
                        productImage: widget.drinks.productImage,
                        liked: widget.drinks.liked,
                        productSize: widget.drinks.productSize,
                        productWeight: null,
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
