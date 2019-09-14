import 'package:flutter/material.dart';
import 'Pages/login_page.dart';
import 'Pages/home_page.dart';
import 'Pages/Products_page.dart';
import 'Pages/products_details.dart';
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new LoginSignUpPage()
    );
  }
}*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MyHomePage.tag: (context) => MyHomePage(),
    ListPage.tag: (context) => ListPage(), // Productos
    MyDetailPage.tag: (context) => MyDetailPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yafet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}