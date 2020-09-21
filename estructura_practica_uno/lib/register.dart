import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _user = TextEditingController();

  var _email = TextEditingController();

  var _pass = TextEditingController();

  LinearGradient graydi = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFFFFFF), Color(0xFFBCB0A1)]);

  @override
  Widget build(BuildContext context) {
    bool selected = false;
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
                  height: 50,
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
                        const EdgeInsets.only(right: 280, bottom: 5, top: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.white70),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(),
                      hintText: "Email@ejemplo.com",
                      prefix: Icon(Icons.mail),
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
                  height: 50,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            graydi = graydi;
                          });
                          
                          print(selected);
                          if (selected) {
                            graydi = LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green[400], Colors.green[200]]);
                          }
                          if (selected == false) {
                            graydi = LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFFFFFFF), Color(0xFFBCB0A1)]);
                          }
                          
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(gradient: graydi),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            graydi = graydi;
                          });
                          
                          if (selected) {
                            graydi = LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.green[400], Colors.green[200]]);
                          }
                          if (selected == false) {
                            graydi = LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFFFFFFF), Color(0xFFBCB0A1)]);
                          }
                          
                        },
                        child: Text(
                          "Acepto los Terminos y Condiciones de Uso",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        if ((_user.text == "Anna Smith" &&
                            _pass.text == "pass1234" &&
                            _email.text == "user123@gmail.com") | 
                            (_user.text == "a" &&
                            _pass.text == "a" &&
                            _email.text =="a")) {
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
                                                  "¡Usuario ya existente!",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Text(
                                                  "Por favor no lo intente con otras cuentas pues no se estan guardando...",
                                                  style: TextStyle(fontSize: 3),
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
                        } else if (_user.text == "" &&
                            _pass.text == "" &&
                            _email.text == "") {
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
                                                  "¡Campo Vacio!",
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE)));
                          //Home(title: APP_TITLE);

                        }
                      },
                      child: Text("Registrate", style: TextStyle(fontSize: 20)),
                      color: Color(0xFF8B8175),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "¿Ya tienes cuenta?",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Ingresa!",
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
