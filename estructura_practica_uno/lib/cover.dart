import 'package:flutter/material.dart';

import 'Entry.dart';

class Cover extends StatelessWidget {
  const Cover({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Entry()));
        //Home(title: APP_TITLE);
      },
      child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/main.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
    );
  }
}
