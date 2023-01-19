import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
//paginas
import 'package:ejercicio01_crud/pages/pagesTarea/detalleTarea_page.dart';
import 'package:ejercicio01_crud/pages/pagesTarea/editarTarea_page.dart';
import 'package:ejercicio01_crud/pages/pagesTarea/formularioTarea_page.dart';
//widges
import 'package:ejercicio01_crud/widget/appBarPlantilla_widget.dart';
import '../models/Tarea_model.dart';
import '../widget/inputPlantillaStFull_widget.dart';

class HomePageFull extends StatefulWidget {
  HomePageFull({
    super.key,
  });

  @override
  State<HomePageFull> createState() => _HomePageFullState();
}

class _HomePageFullState extends State<HomePageFull> {
  //tareas
  int cantidad = Tarea.cantidadTareas;
  List listaTareas = Tarea.staticTareas;

  Tarea? tarea; //tarea selecionada par editar y enviar a la otra pagina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBarPlantilla(
              titulo: "Tareas",
              tooltip: "nueva tarea",
              icono: Icon(Icons.library_add),
              navegador: "/formulario")),
      //cuerpo
      body: ListView(
        children: [
          Center(
            child: listaTareas.length > 0
                ? Text('Total Tareas: $cantidad ',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                        fontStyle: FontStyle.italic))
                : Text("Agrega una tarea ",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold)),
          ),
          //lista tareas
          _vistaTarea(),
          Container(
            margin: new EdgeInsets.symmetric(vertical: 35),
          )
        ],
      ),
      //footer
      floatingActionButtonLocation: listaTareas.length == 0
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      //solo aparece si existen tareas
      bottomNavigationBar: listaTareas.length == 0
          ? BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(height: 50.0),
            )
          : null,
      floatingActionButton: listaTareas.length > 0
          ? FloatingActionButton.extended(
              onPressed: () {
                _borrarTarea();
              },
              label: Text('Tareas seleccionadas', textAlign: TextAlign.center),
              icon: const Icon(Icons.delete_forever),
              backgroundColor: Colors.redAccent,
            )
          : FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, "/personajes"),
              tooltip: 'Peticion API',
              child: const Icon(Icons.api),
              backgroundColor: Colors.blue,
            ),
    );
  }

  Widget _vistaTarea() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: Tarea.staticTareas.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Card(
                  color: Color.fromARGB(19, 56, 83, 56),
                  shadowColor: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  margin:
                      EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                  child: ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(index.toString()),
                        //Borrar la tarea de la lista
                        IconButton(
                          tooltip: 'borrar',
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            String mensaje = listaTareas[index]
                                .titulo
                                .toString()
                                .toUpperCase();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Tarea $mensaje borrada")));
                            listaTareas.removeAt(index);
                            setState(() {
                              listaTareas;
                              cantidad = listaTareas.length;
                            });
                          },
                        ),
                        //editar tarea
                        IconButton(
                          tooltip: 'editar',
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () async {
                            tarea = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditarTarea(
                                        tarea: listaTareas[index],
                                        tareaIndex: index)));
                          },
                        ),
                        //ver tarea
                        IconButton(
                          tooltip: 'ver',
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.yellowAccent,
                          ),
                          onPressed: () async {
                            tarea = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetallePage(
                                          tarea: listaTareas[index],
                                        )));
                          },
                        ),
                      ],
                    ),
                    title: Text(
                      listaTareas[index].titulo.toString(),
                      style: TextStyle(color: Colors.green),
                    ),
                    trailing: Checkbox(
                      value: Tarea.staticTareas[index].check,
                      onChanged: (bool? value) {
                        setState(() {
                          listaTareas[index].check = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

//boorar los que esten chequeados
  _borrarTarea() {
    //borrar con condicion removeWhere sin condicion remove
    listaTareas.removeWhere((tarea) => tarea.check == true);
    cantidad = listaTareas.length;
    log("borrado" + Tarea.staticTareas.toString());

    setState(() {
      listaTareas;
      cantidad;
    });
  }
}
