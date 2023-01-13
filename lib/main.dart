import 'package:ejercicio01_crud/utills/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //puedes poner variables aquí para toda la clase a modo global

  @override
  Widget build(BuildContext context) {
//puedes poner variables aquí solo para este widget
    return MaterialApp(
      title: 'Ejercicio01 CRUD',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
    );
  }
}
