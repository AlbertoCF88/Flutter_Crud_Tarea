import 'package:ejercicio01_crud/pages/pagesTarea/editarTarea_page.dart';
import 'package:ejercicio01_crud/pages/pagesTarea/formularioTarea_page.dart';
import 'package:ejercicio01_crud/pages/homeFull_page.dart';
import 'package:ejercicio01_crud/pages/pagesApi/HomePersonajes_page.dart';
import 'package:flutter/widgets.dart';


final routes = <String, WidgetBuilder>{
  // rutas
  '/': (BuildContext context) => HomePageFull(),
  '/formulario': (BuildContext context) => Formulario(),
  '/personajes': (BuildContext context) => ListaPersonajes(),
};
