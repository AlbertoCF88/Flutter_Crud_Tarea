import 'package:flutter/material.dart';

class AppBarPlantilla extends StatelessWidget {
  String titulo;
  String tooltip;
  String navegador; //'/formulario'
  Icon icono; //Icon(Icons.library_add)
  AppBarPlantilla({
    super.key,
    required this.titulo,
    required this.tooltip,
    required this.navegador,
    required this.icono,
  });
//crear nueva instancias si crear pila de navegacion
//para poder usar var staticas y las pinte

//ejemplo padre:
  /*   appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBarPlantilla(
              titulo: "Tareas",
              tooltip: "nueva tarea",
              navegador: "/formulario")),*/
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: AppBar(
        title: Text(titulo),
        //quitar flecha atras
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: icono,
            tooltip: tooltip,
            onPressed: () {
              Navigator.pushNamed(context, navegador);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Contacto',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Alberto Carrasco Fernández')));
            },
          ),
        ],
      ),
    );
  }
}
