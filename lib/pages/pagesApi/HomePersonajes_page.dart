import 'package:flutter/material.dart';
import 'package:ejercicio01_crud/models/PersonajeRick_model.dart';

import '../../providers/apiRick_provider.dart';
import '../../widget/cardRoutePlantilla_widget.dart';
import 'detallePersonaje_page.dart';

class ListaPersonajes extends StatelessWidget {
  ListaPersonajes({Key? key}) : super(key: key);
  //servicio api
  final HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick y Morty'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        //Es donde vamos a recibir los datos de tipo Future
        future: http.getPersonajes(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PersonajeRick>> snapshot) {
          //Comprobar si ya tenemos los datos
          if (snapshot.hasData) {
            //Pintar la lista de personajes
            List<PersonajeRick> pj = snapshot.data!;
            //Iterar esa lista y pintar un card por cada elemento
            return ListView(
              children: pj
                  .map((PersonajeRick pj) => CardRoutePlantilla(
                      colorBorde: Color.fromARGB(255, 0, 38, 255),
                      colorFondo: Color.fromARGB(123, 33, 50, 148),
                      ColorSombra: Color.fromARGB(255, 4, 27, 49),
                      //img o icono
                      iconoVer: false,
                      img: NetworkImage(pj.image ?? '???'),
                      icono: Icon(Icons.verified_user_rounded,
                          color: Colors.white, size: 30),
                      titulo: pj.name,
                      subtitulo: pj.species,
                      ruta: DetallePersonaje(urlPj: pj.id.toString())))
                  .toList(),
            );
          }
          //Devolver un spinner o circular progress indicator por defecto
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
