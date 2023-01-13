import 'package:flutter/material.dart';

import '../models/tarea_model.dart';
import '../widget/appBarPlantilla_widget.dart';
import '../widget/inputPlantillaStFull_widget.dart';

class EditarTarea extends StatefulWidget {
  late Tarea tarea;
  late int tareaIndex;

  EditarTarea({
    super.key,
    required this.tareaIndex,
    required this.tarea,
  });

  @override
  State<EditarTarea> createState() => _EditarTareaState();
}

class _EditarTareaState extends State<EditarTarea> {
  @override
  Widget build(BuildContext context) {
    String valorTitulo = "";
    TextEditingController tituloCtrl = TextEditingController();

    String valorDesc = "";
    TextEditingController descCtrl = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBarPlantilla(
              titulo: "Editar Tarea",
              tooltip: "volver",
              icono: Icon(Icons.task),
              navegador: "/")),
      //cuerpo
      body: Center(
        child: Column(
          children: [
            //necesito forzar crear una nueva isntancia del Home y
            //no volver atas sin mas
            InpuntPlantillaFull(
                icono: Icon(Icons.title_outlined),
                valorInput: valorTitulo,
                contadorLetras: 10,
                label: widget.tarea.titulo.toString(),
                ayudaTexto: "Titulo de la tarea",
                inputTextoCtrl: tituloCtrl,
                tipoTeclado: TextInputType.text),
            InpuntPlantillaFull(
                icono: Icon(Icons.description_outlined),
                valorInput: valorDesc,
                contadorLetras: 20,
                label: widget.tarea.descripcion.toString(),
                ayudaTexto: "Descripcion",
                inputTextoCtrl: descCtrl,
                tipoTeclado: TextInputType.text),

            ElevatedButton(
                onPressed: () {
                  _mod(tituloCtrl, descCtrl);
                },
                child: const Text('Modificar tarea')),
          ],
        ),
      ),
    );
  }

  _mod(TextEditingController tituloCtrl, TextEditingController descCtrl) {
    for (var i = 0; i < Tarea.staticTareas.length; i++) {
      if (tituloCtrl.text == "") {
        tituloCtrl.text = widget.tarea.titulo.toString();
      }
      if (descCtrl.text == "") {
        descCtrl.text = widget.tarea.descripcion.toString();
      }
      if (widget.tareaIndex == i) {
        Tarea.staticTareas[i].titulo = tituloCtrl.text;
        Tarea.staticTareas[i].descripcion = descCtrl.text;
        return Navigator.pushNamed(context, '/');
      }
    }
  }
}

/**
 * 
 * 
 *  return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBarPlantilla(
              titulo: "Nueva tarea",
              tooltip: "nueva tarea",
              icono: Icon(Icons.exit_to_app),
              navegador: "/")),
      //cuerpo
      body: Center(
        child: Column(
          children: [
       
          ],
        ),
      ),
    );
  }
 */
