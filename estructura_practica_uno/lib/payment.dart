import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

void main() => runApp(Payment());

// ignore: must_be_immutable
class Payment extends StatelessWidget {
  String metopago = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagos',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pagos",style: TextStyle(fontFamily: "AkzidenzGrotesk-MediumItalic"),),
          backgroundColor: Color(0xFF214254),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  child: Text(
                    'Elige tu método de pago:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                metopago = "Tarjeta de Crédito";
                showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                            child: Image(
                              image: AssetImage("images/coffe.jpg"),
                            ),
                            fit: BoxFit.fill,
                          ), 
                        Padding(
                          padding: const EdgeInsets.only(right: 50,top: 10,bottom: 10),
                          child: Row(
                            children: [
                              IconButton(
                          icon: Icon(Icons.fastfood),
                          onPressed: () {},
                          color: Colors.black,
                      ),
                              Column(
                                children: [
                                  Text("¡Orden Exitosa!",style: TextStyle(fontSize: 15,fontFamily: "AkzidenzGrotesk-MediumItalic"),),
                                  Text(metopago),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil."),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE)));
                        /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Cover())); */
                      },
                      child: Text("Aceptar"),
                    ),
                  ],
                );
                }
                );
              },
                          child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFBCB0A1), Color(0xFF8B8175)])),
                  child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  image: AssetImage("images/creditc.png"),
                                  height: 100,
                                  width: 100,
                                ),
                              Text("Tarjeta de crédito",style: TextStyle(color: Colors.white,fontFamily: "AkzidenzGrotesk-MediumItalic")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 85,
                            left: 240,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.border_color),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                ),
            ),
            GestureDetector(
              onTap: () {
                metopago = "Paypal";
                showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                            child: Image(
                              image: AssetImage("images/coffe.jpg"),
                            ),
                            fit: BoxFit.fill,
                          ), 
                        Padding(
                          padding: const EdgeInsets.only(right: 50,top: 10,bottom: 10),
                          child: Row(
                            children: [
                              IconButton(
                          icon: Icon(Icons.fastfood),
                          onPressed: () {},
                          color: Colors.black,
                      ),
                              Column(
                                children: [
                                  Text("¡Orden Exitosa!",style: TextStyle(fontSize: 15,fontFamily: "AkzidenzGrotesk-MediumItalic"),),
                                  Text(metopago),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil."),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE)));
                        /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Cover())); */
                      },
                      child: Text("Aceptar"),
                    ),
                  ],
                );
                }
                );
              },
                          child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFBCB0A1), Color(0xFF8B8175)])),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("images/paypal.png"),
                            height: 100,
                            width: 100,
                          ),
                          Text("Paypal",style: TextStyle(color: Colors.white,fontFamily: "AkzidenzGrotesk-MediumItalic")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 85,
                        left: 240,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.border_color),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                metopago = "Tarjeta de Regalo";
                showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                            child: Image(
                              image: AssetImage("images/coffe.jpg"),
                            ),
                            fit: BoxFit.fill,
                          ), 
                        Padding(
                          padding: const EdgeInsets.only(right: 50,top: 10,bottom: 10),
                          child: Row(
                            children: [
                              IconButton(
                          icon: Icon(Icons.fastfood),
                          onPressed: () {},
                          color: Colors.black,
                      ),
                              Column(
                                children: [
                                  Text("¡Orden Exitosa!",style: TextStyle(fontSize: 15,fontFamily: "AkzidenzGrotesk-MediumItalic"),),
                                  Text(metopago),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil."),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE)));
                        /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Cover())); */
                      },
                      child: Text("Aceptar"),
                    ),
                  ],
                );
                }
                );
              },
                          child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFBCB0A1), Color(0xFF8B8175)])),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("images/giftc.png"),
                            height: 100,
                            width: 100,
                          ),
                          Text("Tarjeta de Regalo",style: TextStyle(color: Colors.white,fontFamily: "AkzidenzGrotesk-MediumItalic")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 85,
                        left: 240,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.border_color),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
