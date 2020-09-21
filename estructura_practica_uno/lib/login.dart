import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'register.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  var _user = TextEditingController();
  var _pass = TextEditingController();
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
        resizeToAvoidBottomPadding: false,
        backgroundColor:
            Colors.transparent, //Si no no se alcanza a ver el degradado
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Image(
                  image: AssetImage("images/cupping.png"),
                  height: 200,
                  width: 200,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 200, bottom: 5),
                    child: Text(
                      "Nombre Completo",
                      style: TextStyle(color: Colors.white70),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  child: TextField(
                    controller: _user,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(),
                      hintText: "Ingrese Nombre",
                      prefix: Icon(Icons.border_color),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 250, bottom: 5, top: 10),
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.white70),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  child: TextField(
                    controller: _pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "Contraseña",
                      prefix: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width - 50,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        if ((_user.text == "Anna Smith" &&
                            _pass.text == "pass1234") | (_user.text =="a" && _pass.text=="a")) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE)));
                          //Home(title: APP_TITLE);
                        } else {
                          print("INCORRECTO");

                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.warning),
                                              onPressed: () {},
                                              color: Colors.black,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "¡Usuario o Contraseña Incorrecta!",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Aceptar"),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Text("Entrar", style: TextStyle(fontSize: 20)),
                      color: Color(0xFF8B8175),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "Usuario y Contraseña:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Usuario: Anna Smith",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Text(
                                      "Contraseña: pass1234",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Aquí en cupping tenemos la mejor seguridad de datos personales",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    "Jaja por favor no nos demanden",
                                    style: TextStyle(fontSize: 3),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Aceptar"),
                              ),
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "¿Olvidaste Tu Password?",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "¿Aun no tienes cuenta?",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Registrate!",
                    style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline),
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
