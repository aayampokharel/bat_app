import 'package:flutter/material.dart';
import 'package:x/Route_generator.dart';
import 'package:x/bat_card.dart';

import 'map_description.dart';
import 'nav_row.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: Route_generator.route_generate,
      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            fontSize: 1.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool bottomhome = true;
  bool bottomwishlist = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Bat\nCollection",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  nav_row("All"),
                  SizedBox(width: 15),
                  nav_row("Gray Nicollis"),
                  SizedBox(width: 15),
                  nav_row("GM"),
                  SizedBox(width: 15),
                  nav_row("SS"),
                  SizedBox(width: 15),
                  nav_row("Kookabura"),
                  SizedBox(width: 15),
                  nav_row("New Balance"),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bat_card(Bat["GN"]["bat_name"], Bat["GN"]["price"],
                        Bat["GN"]["image-front"],
                        r: 225, b: 91, g: 76),
                    bat_card(Bat["GM"]["bat_name"], Bat["GM"]["price"],
                        Bat["GM"]["image-front"],
                        r: 206, b: 207, g: 213),
                    bat_card(Bat["NB"]["bat_name"], Bat["NB"]["price"],
                        Bat["NB"]["image-front"],
                        r: 240, b: 127, g: 172),
                    bat_card(Bat["SS"]["bat_name"], Bat["SS"]["price"],
                        Bat["SS"]["image-front"],
                        r: 139, b: 218, g: 141),
                    bat_card(Bat["KK"]["bat_name"], Bat["KK"]["price"],
                        Bat["KK"]["image-front"],
                        r: 209, b: 209, g: 209),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(9, 255, 170, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {
              setState(() {
                bottomhome = true;
                bottomwishlist = false;
                Navigator.of(context).pushReplacementNamed('home');
              });
            },
            icon: Image.asset(
              bottomhome
                  ? "images/BOTTOMNAV/COLORED_HOME.png"
                  : "images/BOTTOMNAV/HOME.png",
              height: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                bottomhome = false;
                bottomwishlist = true;
                Navigator.of(context).pushNamed('wishlist');
              });
            },
            icon: Image.asset(
              // bottomwishlist ? "images/BOTTOMNAV/COLORED_WISHLIST.png" :
              'images/BOTTOMNAV/WISHLIST.png',
              height: 50,
            ),
          )
        ]),
      ),
    );
  }
}
