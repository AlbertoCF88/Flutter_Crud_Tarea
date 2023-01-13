import 'package:flutter/material.dart';

class InpuntPlantillaFull extends StatefulWidget {
  //controlar el textController en el padre creando un ctrl por cada input
  final TextEditingController
      inputTextoCtrl; // TextEditingController inputPruebaCtrl = TextEditingController();

  String
      valorInput; //alorInput controlado por el padre como un string,     String valorInput="";
  final bool verIcono;
  final Icon icono; //Eje Icon(Icons.passwords)
  final double marginTop;
  final double paddingSimetrico;
  final bool ocultaTexto;
  final int contadorLetras;
  final String ayudaTexto;
  final String label;
  final double altura;
  final TextInputType tipoTeclado;
  // VoidCallback   onClick; //funcion gestionada por el padre, eje  onClick: () => { nombreFuncion},

  //tipos teclado:
  // TextInputType.datetime,emailAddress,multiline ,name,none
  //number,phone,streetAddress ,text, url ,values ,visiblePassword

  InpuntPlantillaFull(
      {Key? key,
      required this.icono,
      required this.inputTextoCtrl,
      required this.valorInput,
      required this.contadorLetras,
      required this.label,
      required this.ayudaTexto,
      required this.tipoTeclado,
      // required this.onClick,
      //opcionales con valor por defecto
      this.verIcono = true,
      this.ocultaTexto = false,
      this.marginTop = 15,
      this.paddingSimetrico = 20,
      this.altura = 80})
      : super(key: key);

  @override
  State<InpuntPlantillaFull> createState() => _InpuntPlantillaFullState();
}

class _InpuntPlantillaFullState extends State<InpuntPlantillaFull> {
  @override
  Widget build(BuildContext context) {
    //las variables del Stafull se llaan poniendo widget delante
    return Container(
      height: widget.altura,
      margin: EdgeInsets.only(top: widget.marginTop),
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingSimetrico,
      ),
      child: TextField(
        keyboardType: widget.tipoTeclado,
        obscureText: widget.ocultaTexto,
        controller: widget.inputTextoCtrl,
        textCapitalization: TextCapitalization.sentences,
        //Estilos
        decoration: InputDecoration(
          //borde
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          counterText: widget.valorInput.length.toString() +
              "/" +
              widget.contadorLetras.toString(),
          counterStyle: widget.valorInput.length >= widget.contadorLetras
              ? TextStyle(color: Colors.blue, fontSize: 14)
              : TextStyle(color: Colors.red, fontSize: 14),

          hintText: widget.ayudaTexto,
          //La etiqueta para espeficar el nombre input
          label: Text(widget.label),
          //HinteTExt es un texto de ayuda
          helperText: 'Mínimo de letras ' + widget.contadorLetras.toString(),
          icon: widget.verIcono ? widget.icono : null,
          //para cambiar el color y la forma del  borde al hacer focus
        ),
        onChanged: (value) {
          widget.valorInput = value;
          // widget.onClick();
          setState(() {
            widget.valorInput = value;
          });
        },
      ),
    );
  }
}
