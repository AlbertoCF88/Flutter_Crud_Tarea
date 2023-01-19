import 'package:flutter/material.dart';
import '../../models/Tarea_model.dart';
import '../../widget/appBarPlantilla_widget.dart';

class DetallePage extends StatelessWidget {
  late Tarea tarea; //objeto tarea enviado desde el homeFull

  DetallePage({
    super.key,
    required this.tarea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), 
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
