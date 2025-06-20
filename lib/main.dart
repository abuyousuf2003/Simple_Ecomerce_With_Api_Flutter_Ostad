import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_cart_api/ecom_with_api.dart';
import 'package:product_cart_api/home_page_1.dart';
// import 'package:device_preview_plus/device_preview_plus.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return ecomWithApi();
  //  HomePage1();
  }
}

