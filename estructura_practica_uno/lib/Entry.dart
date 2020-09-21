import 'package:estructura_practica_1/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Entry extends StatelessWidget {
  const Entry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF214254),
              Color(0xFF121B22),
            ]),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, //Si no no se alcanza a ver el degradado
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                Image(
                  image: AssetImage("images/cupping.png"),
                  height: 250,
                  width: 250,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Registrase", style: TextStyle(fontSize: 20)),
                    color: Color(0xFF8B8175),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width - 50,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                        //Home(title: APP_TITLE);
                      },
                      child: Text("Ingresar", style: TextStyle(fontSize: 20)),
                      color: Color(0xFF8B8175),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
