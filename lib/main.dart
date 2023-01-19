import 'package:ejercicio01_crud/utills/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //quitar la etiqueta debug
      debugShowCheckedModeBanner: false,
      title: 'Crud y Api',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
    );
  }
}
