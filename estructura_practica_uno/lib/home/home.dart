import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/cover.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductItemCart> cart = []; //Carrito de compras
  var _scrafty = GlobalKey<ScaffoldState>(); //scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scrafty,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              PROFILE_TITLE,
              style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),
            ),
            actions: <Widget>[],
          ),
          body: Padding(
            padding: EdgeInsets.all(24.0),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          PROFILE_PICTURE,
                        ),
                        minRadius: 40,
                        maxRadius: 40,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      PROFILE_NAME,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "AkzidenzGrotesk-MediumItalic"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      PROFILE_EMAIL,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontFamily: "OpenSans"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ListTile(
                      title: Text(PROFILE_CART),
                      leading: Icon(Icons.shopping_cart),
                      onTap: () {
                        _openCartPage();
                      },
                    ),
                    ListTile(
                      title: Text(PROFILE_WISHES),
                      leading: Icon(Icons.thumb_up),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(PROFILE_HISTORY),
                      leading: Icon(Icons.store),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(PROFILE_SETTINGS),
                      leading: Icon(Icons.settings),
                      onTap: () {},
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text(PROFILE_LOGOUT),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Cover()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openCupsAlert,
            child: ItemHome(
              // DONE: Al hacer clic, que muestre un snackbar de "Proximamente"
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() async {
    // Done: completar en navigator pasando los parametros a la pagina de HotDrinksPage
    cart = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            shoppingcart: cart, //Para poder ir llenando el carro
            drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS),
          );
        },
      ),
    );
  }

  void _openGrainsPage() async {
    cart = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(
            shoppingcart: cart, //Para poder ir llenando el carro
            grainsList: ProductRepository.loadProducts(ProductType.GRANO),
          );
        },
      ),
    );
  }

  void _openDessertPage() async {
    cart = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DessertsPage(
            shoppingcart: cart, //Para poder ir llenando el carro
            dessertsList: ProductRepository.loadProducts(ProductType.POSTRES),
          );
        },
      ),
    );
  }

  void _openCartPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Cart(
            productsList: cart,
          );
        },
      ),
    );
  }

  void _openCupsAlert() {
    

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Color(0xFFFABF7C),
          title: Text(
            "PRONTO: NUEVOS PRODUCTOS",
            style: TextStyle(fontSize: 15),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text("No te lo pierdas!")),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _scrafty.currentState.hideCurrentSnackBar();
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
    _scrafty.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text("PRONTO: NUEVOS PRODUCTOS"),
          duration: Duration(seconds: 0),
        ),
      );
  }
}
