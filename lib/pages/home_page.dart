import 'package:flutter/material.dart';
import 'package:flutter_app_mobx_exemple/pages/carros_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx Exemple'),
      ),
      body: CarrosList(),
    );
  }
}