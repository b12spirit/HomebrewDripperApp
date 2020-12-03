import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        title: Text("Done"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ListTile(
              title: Text(
                "Enjoy your amazing" + "\n" + " handmade cofee",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    color: Color(0xff4C748B)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
