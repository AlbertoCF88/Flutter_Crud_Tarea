import 'package:flutter/material.dart';

class InpuntPlantillaFull extends StatefulWidget {
  //controlar el textController en el padre creando un ctrl por cada input
  // TextEditingController inputPruebaCtrl = TextEditingController();
  final TextEditingController inputTextoCtrl;

  String valorInput; //valorInput controlado por el padre c
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
    //las variables del Statefulnse llaman poniendo widget delante
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          counterText: widget.valorInput.length.toString() +
              "/" +
              widget.contadorLetras.toString(),
          //controlar el color del texto segun numero de caracteres
          counterStyle: widget.valorInput.length >= widget.contadorLetras
              ? TextStyle(color: Colors.blue, fontSize: 14)
              : TextStyle(color: Colors.red, fontSize: 14),
          //HinteTExt es un texto de ayuda
          hintText: widget.ayudaTexto,
          label: Text(widget.label),
          helperText: 'Mínimo de letras ' + widget.contadorLetras.toString(),
          icon: widget.verIcono ? widget.icono : null,
        ),
        onChanged: (value) {
          widget.valorInput = value;
          setState(() {
            widget.valorInput = value;
          });
        },
      ),
    );
  }
}
