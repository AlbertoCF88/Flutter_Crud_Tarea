import 'package:flutter/material.dart';
import '../models/tarea_model.dart';
import '../widget/appBarPlantilla_widget.dart';

class DetallePage extends StatelessWidget {
  late Tarea tarea;
  late int tareaIndex;
  DetallePage({
    super.key,
    required this.tareaIndex,
    required this.tarea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBarPlantilla(
                titulo: "Detalle ",
                tooltip: "volver",
                icono: Icon(Icons.exit_to_app),
                navegador: "/")),
        //cuerpo
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Column(
              children: [
                Text(tarea.titulo.toString(),
                    style: TextStyle(color: Colors.green, fontSize: 25)),
                Text(tarea.descripcion.toString()),
              ],
            ),
          ),
        ));
  }
}
