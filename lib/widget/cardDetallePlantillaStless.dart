import 'package:flutter/material.dart';

class CardDetallePlantilla extends StatelessWidget {
  final Color colorFondo;
  final Color colorSombra;
  final ImageProvider imagen;
  final double altoImg;
  var titulo;
  var Subtitulo;
  final List<Map<dynamic, dynamic>> listaTextos;
  final double alturaTextoAdiocinal;
  final bool subtituloVer;

  CardDetallePlantilla({
    super.key,
    required this.colorFondo,
    required this.colorSombra,
    required this.imagen,
    required this.titulo,
    required this.Subtitulo,
    //opcionales
    this.subtituloVer = true,
    this.altoImg = 0.5, //porcentaje de la anchura Pantalla
    this.alturaTextoAdiocinal = 100,
    this.listaTextos = const [],
  });

  @override
  Widget build(BuildContext context) {
    /*Eje  final List<Map<String, dynamic>> listaTextos = [
      {
        'ti': 'titulo',
        'sub': 'subtitulo',
      },
      {
        'ti': 'a',
        'sub': 'b',
      },
      {
        'ti': 'c',
        'sub': 'd',
      },
    ];*/

    var imgNotFound = AssetImage('assets/images/homer.jpg');
    var alturaPantalla = MediaQuery.of(context).size.height * altoImg;
    return Card(
      color: colorFondo,
      shadowColor: colorSombra,
      clipBehavior: Clip.antiAlias,
      //Cambiar el grosor del borde como el radio
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Column(
        children: [
          FadeInImage(
            image: imagen == null ? imgNotFound : imagen,
            placeholder: AssetImage('assets/images/carga.gif'),
            fit: BoxFit.cover,
            //  width: 100,
            height: alturaPantalla,
          ),
          Center(
            child: ListTile(
              title: Text(titulo,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ],
                  )),
              subtitle: subtituloVer ? Text(Subtitulo) : null,
            ),
          ),
          SizedBox(
            height: alturaTextoAdiocinal,
            child: ListView.builder(
                itemCount: listaTextos.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Container(
                          child: Card(
                            margin: EdgeInsets.all(2),
                            color: Color.fromARGB(0, 184, 183, 183),
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              if (constraints.maxWidth > 320) {
                                return _horizontal(index);
                              } else {
                                return _vertical(index);
                              }
                            }),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

//segun movil a 320px ancho
  Widget _vertical(index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black54,
            ),
          )),
          Text(listaTextos[index]['ti'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(listaTextos[index]['sub']),
        ]);
  }

  Widget _horizontal(index) {
    return Row(children: [
      Text(listaTextos[index]['ti'],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(listaTextos[index]['sub']),
    ]);
  }
}
