import 'package:flutter/material.dart';
import 'dart:developer';

class CardRoutePlantilla extends StatelessWidget {
  final Color colorBorde; //Colors.red
  final Color colorFondo; //Color.fromRGBO
  final Color ColorSombra;
  final Icon icono; //eje Icon(Icons.add_a_photo, color: Colors.white, size: 30)
  var titulo;
  var subtitulo;
  final bool iconoVer;
  var ruta; //DetallePj(urlPj: pj.url) //-->nombrePag2(varpag2: varPag1)

  CardRoutePlantilla({
    super.key,
    required this.colorBorde, //eje Colors.green
    required this.colorFondo,
    required this.ColorSombra, //Color.fromARGB
    required this.icono,
    required this.titulo,
    required this.ruta,
    //Opcionales
    this.subtitulo = "", //si no pongo nada no sale nada
    this.iconoVer = true,
  });
//API CARD ROUTE A PAGINA DETALLE

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      color: colorFondo,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colorBorde, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      shadowColor: ColorSombra,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              //Navegacion entre pantallas
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ruta));
            },
            leading: iconoVer ? icono : null,
            title: Text(
              titulo,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: subtitulo == "" ? null : Text(subtitulo),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
