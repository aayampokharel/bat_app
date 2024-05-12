import 'package:flutter/material.dart';
import 'package:x/bat_description.dart';

import 'map_description.dart';

class wishlist extends StatefulWidget {
  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
        ),
      ),
      body: ListView.builder(
          itemCount: bat_description.batcodeList.length,
          itemBuilder: (context, index) {
            Map batcode = Bat[bat_description.batcodeList[index]];
            return Card(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 247, 242, 249),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            batcode['image-front'],
                            height: 200,
                          ),
                        ),
                        Positioned(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          bottom: 8.0,

                          right: 8.0,

                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  bat_description.batcodeList.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          batcode["bat_name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          batcode["price"],
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
