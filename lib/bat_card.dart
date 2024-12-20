import 'package:flutter/material.dart';

class bat_card extends StatelessWidget {
  int r;
  int g;
  int b;
  String price;

  String image;
  String bat;

  bat_card(this.bat, this.price, this.image,
      {this.r = 255, this.g = 255, this.b = 255});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/${bat}",
            arguments: " $bat _$price _$image");
      },
      child: Card(
        color: Color.fromARGB(255, r, g, b),
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width * 0.90,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bat,
                style: TextStyle(
                  fontFamily: 'fabrands',
                  fontSize: 18,
                ),
              ),
              Text("$price",
                  style: TextStyle(fontSize: 14, color: Colors.white70)),
              Image.asset(image, width: 200),
            ],
          ),
        ),
      ),
    );
  }
}
