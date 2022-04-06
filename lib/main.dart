import 'package:api_calling/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'screen',
    routes: {
      'screen': (context) => Home(),
    },
  ));
}
