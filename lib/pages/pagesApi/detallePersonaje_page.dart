import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/PersonajeRick_model.dart';
import '../../providers/apiRick_provider.dart';
import '../../widget/cardDetallePlantilla_widget.dart';

class DetallePersonaje extends StatefulWidget {
  late String
      urlPj; //numero personaje para terminar la url mandado desde HomePersonaje

  DetallePersonaje({
    super.key,
    required this.urlPj,
  });

  @override
  State<DetallePersonaje> createState() => _DetallePersonajeState();
}

class _DetallePersonajeState extends State<DetallePersonaje> {
  HttpService http = HttpService(); //provider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Detalles'),
      ),
      body: Container(
        margin: new EdgeInsets.all(10),
        child: Column(children: [
          //input
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'escribir Id',
              label: Text('Escribe ID numérico del Personaje'),
            ),
            onChanged: (value) {
              setState(() {
                widget.urlPj = value.toString();
                idPersonaje(widget.urlPj);
              });
            },
          ),
          //buscar Pj
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                idPersonaje(widget.urlPj),
              ]),
        ]),
      ),
    );
  }

  Widget idPersonaje(idPj) {
    var newId = http.getIdPersonaje(idPj);

    return FutureBuilder(
      future: newId,
      builder: (context, AsyncSnapshot<PersonajeRick> snapshot) {
        if (snapshot.hasData) {
          //si enccuentra Pj pintar tarjeta
          PersonajeRick pj = snapshot.data!;
          Card(
            child: Text("${pj.name}"),
          );
          return Center(
              child: CardDetallePlantilla(
                  colorFondo: Colors.blue,
                  colorSombra: Colors.black38,
                  imagen: NetworkImage(pj.image ?? '????'),
                  titulo: pj.name,
                  Subtitulo: pj.status ?? '????',
                  listaTextos: [
                {
                  'ti': "Especie: ",
                  'sub': pj.species,
                },
                {
                  'ti': 'Tipo: ',
                  'sub': pj.type,
                },
                {
                  'ti': 'Género: ',
                  'sub': pj.gender,
                },
                {
                  'ti': 'Origen: ',
                  'sub': pj.origin?.name,
                },
                {
                  'ti': 'Localización: ',
                  'sub': pj.location?.name,
                },
                {
                  'ti': 'Cantidad de episodios: ',
                  'sub': pj.episode?.length.toString(),
                },
                // {
                //   'ti': '_created: ',
                //   'sub': pj.created,
                // },
              ]));
        } else if (snapshot.hasError) {
          //en caso de error
          return Container(
            margin: new EdgeInsets.symmetric(vertical: 20),
            child: Text("El personaje no existe"),
          );
        } else {
          // Por defecto muestra un loading spinner
          return Container(
            margin: new EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
