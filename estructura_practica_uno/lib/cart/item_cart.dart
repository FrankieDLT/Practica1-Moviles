import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemCart extends StatefulWidget {
  ProductItemCart product;
  ValueChanged<double> onAmountUpdated;
  List<ProductItemCart> productsList;
  int index;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
    @required productsList,
    @required index,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFABF7C),
      margin: EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFEC9762), Color(0xFFFABF7C)])),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              right: 10,
              top: 10,
              bottom: 0,
            ),
            child: Image.network(
              widget.product.productImage,
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 135,
              left: 260,
              bottom: 10,
            ),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: Icon(Icons.restore_from_trash),
                onPressed: () {
                  //print(widget.productsList.indexOf(widget.product));
                  setState(() {
                    print(widget.productsList);
                    print(widget.product);
                    widget.product.productTitle = null;
                    // widget.productsList.remove(widget.product);// (widget.product);
                  });
                },
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 150,
              right: 10,
              top: 0,
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${widget.product.productTitle}",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "AkzidenzGrotesk-MediumItalic"),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ]),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 165,
              right: 10,
              top: 65,
              bottom: 0,
            ),
            child: Text(
              (() {
                if (widget.product.productSize != null) {
                  return "${widget.product.productSize}";
                } else if (widget.product.productWeight != null) {
                  return "${widget.product.productWeight}";
                }
                return "${widget.product.productPortion}";
              })(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 150,
              right: 10,
              top: 100,
              bottom: 0,
            ),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                Text("${widget.product.productAmount}"),
                IconButton(
                    icon: Icon(Icons.remove_circle), onPressed: _remProd),
                Text("\$${widget.product.productPrice}"),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
