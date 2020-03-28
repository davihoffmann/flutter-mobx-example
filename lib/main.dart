import 'package:flutter/material.dart';
import 'package:flutter_app_mobx_exemple/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}