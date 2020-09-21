import 'package:estructura_practica_1/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
         onTap: () {//async{
           //await new Future.delayed(const Duration(seconds : 1)); worth a shot
              for (int i = 0; i < widget.productsList.length; i++) {
              if (widget.productsList.elementAt(i).productTitle == null) {
                setState(() {
                   _total = _total - widget.productsList.elementAt(i).productPrice*widget.productsList.elementAt(i).productAmount;
                widget.productsList.removeAt(i);
                });
              
              }
            }
            },
              child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: widget.productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    product: widget.productsList[index],
                    productsList: widget.productsList,
                    index: index,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 0),
                child: Center(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Total"),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                            ),
                            child: Text(
                              " $_total MX\$",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: MaterialButton(
                          minWidth: 150,
                          onPressed: () {

                           /* setState(() {
                              widget.productsList.removeLast();
                            });*/
                            

                             if(widget.productsList.length>0 && _total!=0){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Payment()));
                          } 
                          },
                          child: Text("Pagar", style: TextStyle(fontSize: 20)),
                          color: Color(0xFF8B8175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
