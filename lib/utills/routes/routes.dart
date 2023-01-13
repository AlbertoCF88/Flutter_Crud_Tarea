import 'package:ejercicio01_crud/pages/editarTarea_page.dart';
import 'package:ejercicio01_crud/pages/formularioFull_page.dart';
import 'package:ejercicio01_crud/pages/homeFull_page.dart';
import 'package:flutter/widgets.dart';

//sin clase

final routes = <String, WidgetBuilder>{
  //Crearemos nuestras rutas
  '/': (BuildContext context) => HomePageFull(),
  '/formulario': (BuildContext context) => Formulario(),

};
