import 'package:flutter/material.dart';

Widget nav_row(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onLongPress: () {},
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 175, 35),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(15.0),
          child: Text(text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
    ),
  );
}
