import 'dart:developer';
import 'dart:io';

import 'package:ejercicio01_crud/models/Tarea_model.dart';
import 'package:ejercicio01_crud/pages/homeFull_page.dart';
import 'package:flutter/material.dart';

import '../../widget/appBarPlantilla_widget.dart';
import '../../widget/inputPlantillaStFull_widget.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
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
              titulo: "Nueva tarea",
              tooltip: "volver",
              icono: Icon(Icons.exit_to_app),
              navegador: "/")),
      //cuerpo
      body: Center(
        child: Column(
          children: [
            InpuntPlantillaFull(
                icono: Icon(Icons.title_outlined),
                valorInput: valorTitulo,
                contadorLetras: 3,
                label: "Titulo de la tarea",
                ayudaTexto: "Titulo de la tarea",
                inputTextoCtrl: tituloCtrl,
                tipoTeclado: TextInputType.text),
            InpuntPlantillaFull(
                icono: Icon(Icons.description_outlined),
                valorInput: valorDesc,
                contadorLetras: 10,
                label: "Descripcion",
                ayudaTexto: "Descripcion",
                inputTextoCtrl: descCtrl,
                tipoTeclado: TextInputType.text),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 35),
              child: ElevatedButton(
                  onPressed: () {
                    _addTarea(tituloCtrl, descCtrl, valorTitulo, valorDesc);
                  },
                  child: const Text('Añadir Tarea')),
            ),
            Container(
              child: Tarea.staticTareas.length >= 10
                  ? Text(
                      "Máximo 10 elementos",
                      style: TextStyle(color: Colors.green),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }

  _addTarea(TextEditingController tituloCtrl, TextEditingController descCtrl,
      String valorTitulo, String valorDesc) {
    int longTitulo = tituloCtrl.text.length;
    int longDesc = descCtrl.text.length;
    if (Tarea.staticTareas.length >= 10) {
      //por hacer algo mas
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('solo admito 10 elementos')));
      return;
    } else {
      //si los campos estan rellenados
      if ((tituloCtrl.text != "" && descCtrl.text != "") &&
          (longTitulo >= 3 && longDesc >= 10)) {
        Tarea t1 = Tarea(
            titulo: tituloCtrl.text, descripcion: descCtrl.text, check: false);
        Tarea.staticTareas.add(t1);
        Tarea.cantidadTareas = Tarea.staticTareas.length;
        //mensaje
        String mensaje = tituloCtrl.text.toUpperCase();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Tarea $mensaje agregada')));
        //salir del formulario
        Navigator.pushNamed(context, "/");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Titulo y descripcion no pueden estar en blanco o no has llegado al mínimo de letras')));
      }
    }
    //limpiar campos
    setState(() {
      valorTitulo = "";
      valorTitulo = "";
    });
  }
}
