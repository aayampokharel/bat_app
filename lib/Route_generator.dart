import 'package:flutter/material.dart';
import 'package:x/bat_description.dart';
import 'package:x/main.dart';
import 'package:x/wishlist.dart';

class Route_generator {
  static Route route_generate(RouteSettings settings) {
    String? args = "${settings.arguments}";
    List<String> data = args.split("_");
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/Gray Nicollis hypernova 3.0':
        // print(data[0]);
        return MaterialPageRoute(
            builder: (_) => bat_description(
                  bat: data[0],
                  price: data[1],
                  image: data[2],
                  bat_code: "GN",
                ));
      case '/GM bat silvercut 2.0':
        return MaterialPageRoute(
            builder: (_) => bat_description(
                  bat: data[0],
                  price: data[1],
                  image: data[2],
                  bat_code: "GM",
                ));
      case '/New Balance Steve Smith edition':
        return MaterialPageRoute(
            builder: (_) => bat_description(
                  bat: data[0],
                  price: data[1],
                  image: data[2],
                  bat_code: "NB",
                ));
      case '/SS SKY NO LIMITS':
        return MaterialPageRoute(
            builder: (_) => bat_description(
                  bat: data[0],
                  price: data[1],
                  image: data[2],
                  bat_code: "SS",
                ));
      case '/KOOKABURA MARNUS ghost EDITON 2.0':
        return MaterialPageRoute(
            builder: (_) => bat_description(
                  bat: data[0],
                  price: data[1],
                  image: data[2],
                  bat_code: "KK",
                ));

      case 'home':
        return MaterialPageRoute(builder: (_) => MyApp());
      case 'wishlist':
        return MaterialPageRoute(builder: (_) => wishlist());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(title: Text("ERROR 914")),
                ));
    }
  }
}
