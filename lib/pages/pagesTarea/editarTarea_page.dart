import 'package:flutter/material.dart';

import '../../models/Tarea_model.dart';
import '../../widget/appBarPlantilla_widget.dart';
import '../../widget/inputPlantillaStFull_widget.dart';

class EditarTarea extends StatefulWidget {
  late Tarea tarea; //OBJETO enviado desde HomeFull
  late int tareaIndex; //index desde HomFull

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
          preferredSize: Size.fromHeight(50.0),
          child: AppBarPlantilla(
              titulo: "Editar Tarea",
              tooltip: "volver",
              icono: Icon(Icons.task),
              navegador: "/")),
      //cuerpo
      body: Center(
        child: Column(
          children: [
            //inputs
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
            //btn
            Container(
              margin: new EdgeInsets.symmetric(vertical: 35),
              child: ElevatedButton(
                  onPressed: () {
                    _mod(tituloCtrl, descCtrl);
                  },
                  child: const Text('Modificar tarea')),
            ),
          ],
        ),
      ),
    );
  }

  _mod(TextEditingController tituloCtrl, TextEditingController descCtrl) {
    //si deja el titulo en blanco pon el texto que tiene por defecto en la tarea que le viene
    if (tituloCtrl.text == "") {
      tituloCtrl.text = widget.tarea.titulo.toString();
    }
    //si deja la descripcion en blanco pon el texto que tiene por defecto en la tarea que le viene
    if (descCtrl.text == "") {
      descCtrl.text = widget.tarea.descripcion.toString();
    }
    //guardamos la tarea modificada en la posicion adecuada que ya viene el indice desde HomeFull_page
    Tarea.staticTareas[widget.tareaIndex].titulo = tituloCtrl.text;
    Tarea.staticTareas[widget.tareaIndex].descripcion = descCtrl.text;
    return Navigator.pushNamed(context, '/');
  }
}
