import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Bean/bean_cuenta_usuario.dart';
import '../../../constantes.dart';

class EnviosEmpresaDetalle extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  final Map item;
  const EnviosEmpresaDetalle(this.usuarioEmpresa, this.item, {Key? key})
      : super(key: key);

  @override
  _EnviosEmpresaDetalleState createState() => _EnviosEmpresaDetalleState();
}

class _EnviosEmpresaDetalleState extends State<EnviosEmpresaDetalle> {
  File? imagen;
  final picker = ImagePicker();

  bool _nombre = true;
  bool _apellido = true;
  bool _correo = true;
  bool _documento = true;
  bool _celular = true;
  bool _direccionDestino = true;
  bool _direccionRecojo = true;
  bool _referenciaDestino = true;
  bool _referenciaRecojo = true;
  bool _distritoDestino = true;
  bool _distritoRecojo = true;
  bool _producto = true;
  bool _descripcionProducto = true;
  bool _notasAdicionales = true;
  bool _codigoPromocional = true;
  final bool _sizeProduct = true;

  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  //List<String> miUsuario;

  bool checkSize0 = false;
  bool checkSize1 = false;
  bool checkSize2 = true;

  bool checkSize4 = false;
  bool checkSize5 = true;
  bool checkSize7 = false;
  bool checkSize8 = true;
  bool checkSize9 = false;
  bool checkSize10 = true;
//datos por defecto
  String sizeProduct = "pequeño";
  String delicado = "no";
  String seguro = "no";
  String contraEntrega = "no";
  String monto = "0.00";

  final _keyCrearEnvio = GlobalKey<FormState>();

  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellido = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController dni = TextEditingController();
  final TextEditingController celular = TextEditingController();
  final TextEditingController direccionDestino = TextEditingController();
  final TextEditingController direccionRecojo = TextEditingController();
  final TextEditingController referenciaDestino = TextEditingController();
  final TextEditingController referenciaRecojo = TextEditingController();
  final TextEditingController dist = TextEditingController();
  late String miActualdistritoDestino = "- - Seleccionar distritoDestino - -";
  late String miActualDistritoRecojo = "- - Seleccionar distritoDestino - -";
  final TextEditingController producto = TextEditingController();
  final TextEditingController size = TextEditingController();

  final TextEditingController descripcionProducto = TextEditingController();
  final TextEditingController notasAdicionales = TextEditingController();
  final TextEditingController codigoPromocional = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      ancho = MediaQuery.of(context).size.width;
      aux = ancho;
      alto = MediaQuery.of(context).size.height;
      relacionEstandar = 640 / 360;
      relacionActual = alto / ancho;
      relacionBanner = 893 / 1452;
      if (relacionEstandar > relacionActual) {
        ancho = alto / relacionEstandar;
      } else {
        alto = ancho * relacionEstandar;
      }
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: alto * 0.02, horizontal: ancho * 0.06),
        child: Form(
          key: _keyCrearEnvio,
          child: ListView(
            children: <Widget>[
              SizedBox(
                //color: Colors.red,
                height: alto * 0.09,
                width: ancho,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/logo_qumpa.png"),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        child: Container(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: ancho * 0.08,
                          ),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(
                              '/principalEmpresa',
                              arguments: widget.usuarioEmpresa);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: alto * 0.04, bottom: alto * 0.01),
                child: Row(
                  children: [
                    Text(
                      "Tipo de Envío:",
                      style: TextStyle(
                        fontSize: ancho * 0.06,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    Text(
                      "${widget.item['tipo']}",
                      style: TextStyle(
                        fontSize: ancho * 0.06,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: alto * 0.02),
                child: Text(
                  "Datos de la persona que Recibe:",
                  style: TextStyle(
                    fontSize: ancho * 0.06,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Nombres:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: ancho * 0.01, top: alto * 0.01),
                          //height: alto * 0.04,
                          child: TextFormField(
                            controller: nombre,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: ancho * 0.01),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color:
                                        _nombre ? kPrimaryColor : Colors.red)),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: Text(
                            "Apellidos:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ancho * 0.04,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ancho * 0.01, top: alto * 0.01),
                          //height: alto * 0.04,
                          child: TextFormField(
                            controller: apellido,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: ancho * 0.01),
                            ),
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: _apellido
                                        ? kPrimaryColor
                                        : Colors.red)),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          child: Text(
                            "Celular:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: ancho * 0.01, top: alto * 0.01),
                          child: TextFormField(
                            controller: celular,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _celular ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _celular ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: ancho * 0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: Text(
                            "DNI (Opcional):",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ancho * 0.04,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ancho * 0.01, top: alto * 0.01),
                          //height: alto * 0.04,
                          child: TextFormField(
                            controller: dni,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _documento ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _documento ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: ancho * 0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Email:(Opcional)",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: correo,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: _correo ? kPrimaryColor : Colors.red)),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: alto * 0.02),
                child: Text(
                  "Datos del Delivery:",
                  style: TextStyle(
                    fontSize: ancho * 0.06,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Dirección de Recojo:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: direccionRecojo,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              _direccionRecojo ? kPrimaryColor : Colors.red)),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "referenciaDestino del lugar de Recojo: (opcional)",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: ancho * 0.04,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: referenciaRecojo,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    //height: 1.5,
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.green,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              _referenciaRecojo ? kPrimaryColor : Colors.red)),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(left: ancho * 0.04),
                height: alto * 0.06,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border.all(
                      color: _distritoRecojo ? kPrimaryColor : Colors.red,
                      width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Center(
                    child: Text(
                      miActualDistritoRecojo,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: ancho * 0.05),
                    ),
                  ),
                  dropdownColor: Colors.white,

                  icon: SizedBox(
                    height: alto * 0.06,
                    width: ancho * 0.15,
                    //color: Colors.green,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -alto * 0.01,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: _distritoRecojo ? kPrimaryColor : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  iconSize: ancho * 0.14,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ancho * 0.05,
                  ),
                  //value: miActualDistrito??'-- Seleccionar distritoDestino --',
                  onChanged: (newValue) {
                    setState(() {
                      miActualDistritoRecojo = newValue as String;
                    });
                  },
                  items: miDistrito
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Container(
                            child: Text(
                              item,
                              textAlign: TextAlign.center,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: _distritoRecojo
                                        ? kPrimaryColor
                                        : Colors.red),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: alto * 0.01,
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Dirección de Entrega:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: direccionDestino,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              _direccionDestino ? kPrimaryColor : Colors.red)),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "referenciaDestino del lugar: (opcional)",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: ancho * 0.04,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: referenciaDestino,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    //height: 1.5,
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.green,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              _referenciaDestino ? kPrimaryColor : Colors.red)),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(left: ancho * 0.04),
                height: alto * 0.06,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border.all(
                      color: _distritoDestino ? kPrimaryColor : Colors.red,
                      width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Center(
                    child: Text(
                      miActualdistritoDestino,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: ancho * 0.05),
                    ),
                  ),
                  dropdownColor: Colors.white,

                  icon: SizedBox(
                    height: alto * 0.06,
                    width: ancho * 0.15,
                    //color: Colors.green,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -alto * 0.01,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color:
                                _distritoDestino ? kPrimaryColor : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  iconSize: ancho * 0.14,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ancho * 0.05,
                  ),
                  //value: miActualDistrito??'-- Seleccionar distritoDestino --',
                  onChanged: (newValue) {
                    setState(() {
                      miActualdistritoDestino = newValue as String;
                    });
                  },
                  items: miDistrito
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Container(
                            child: Text(
                              item,
                              textAlign: TextAlign.center,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: _distritoDestino
                                        ? kPrimaryColor
                                        : Colors.red),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: alto * 0.01,
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Datos del Producto:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Producto que se envía:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: producto,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: _producto ? kPrimaryColor : Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: _producto ? kPrimaryColor : Colors.red,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 4, horizontal: ancho * 0.01),
                  ),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Descripción adicional (opcional):",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: descripcionProducto,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: const BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                    bottom: BorderSide(width: 1, color: kPrimaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Tamaño del paquete:",
                style: TextStyle(
                    color: _sizeProduct ? Colors.black54 : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: ancho * 0.04),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          checkSize0 = true;
                          checkSize1 = false;
                          checkSize2 = false;
                          sizeProduct = "grande";
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.airport_shuttle,
                          color: checkSize0 ? kPrimaryColor : Colors.black54,
                          size: ancho * 0.1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          checkSize0 = false;
                          checkSize1 = true;
                          checkSize2 = false;
                          sizeProduct = "mediano";
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.directions_car,
                          color: checkSize1 ? kPrimaryColor : Colors.black54,
                          size: ancho * 0.1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          checkSize0 = false;
                          checkSize1 = false;
                          checkSize2 = true;
                          sizeProduct = "pequeño";
                        });
                      },
                      child: Center(
                        child: Icon(
                          Icons.motorcycle,
                          color: checkSize2 ? kPrimaryColor : Colors.black54,
                          size: ancho * 0.1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          checkSize0 = true;
                          checkSize1 = false;
                          checkSize2 = false;
                        });
                      },
                      child: Container(
                        height: alto * 0.05,
                        child: Center(
                          child: Text(
                            "Grande",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: checkSize0 ? Colors.white : Colors.grey,
                                fontSize: ancho * 0.04),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: kPrimaryColor),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(alto * 0.03),
                            bottomLeft: Radius.circular(alto * 0.03),
                          ),
                          color: checkSize0 ? kPrimaryColor : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          checkSize0 = false;
                          checkSize1 = true;
                          checkSize2 = false;
                        });
                      },
                      child: Container(
                        height: alto * 0.05,
                        child: Center(
                          child: Text(
                            "Mediano",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: checkSize1 ? Colors.white : Colors.grey,
                                fontSize: ancho * 0.04),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: kPrimaryColor),
                          color: checkSize1 ? kPrimaryColor : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          checkSize0 = false;
                          checkSize1 = false;
                          checkSize2 = true;
                        });
                      },
                      child: Container(
                        height: alto * 0.05,
                        child: Center(
                          child: Text(
                            "Pequeño",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: checkSize2 ? Colors.white : Colors.grey,
                                fontSize: ancho * 0.04),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: kPrimaryColor),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(alto * 0.03),
                            bottomRight: Radius.circular(alto * 0.03),
                          ),
                          color: checkSize2 ? kPrimaryColor : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "* Por defecto es pequeño *",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black54, fontSize: ancho * 0.03),
              ),
              SizedBox(
                height: alto * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "El paquete es delicado?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: ancho * 0.04),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: alto * 0.01),
                                      child: Text(
                                        "Si",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ancho * 0.04),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ancho * 0.01,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: alto * 0.008),
                                      height: ancho * 0.075,
                                      width: ancho * 0.1,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(ancho * 0.04),
                                          bottomLeft:
                                              Radius.circular(ancho * 0.04),
                                        ),
                                        color: checkSize4
                                            ? kPrimaryColor
                                            : Colors.white,
                                      ),
                                      child: checkSize4
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size: ancho * 0.05,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(""),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    checkSize4 = true;
                                    checkSize5 = false;
                                    delicado = "si";
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: alto * 0.008),
                                      height: ancho * 0.075,
                                      width: ancho * 0.1,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(ancho * 0.04),
                                          bottomRight:
                                              Radius.circular(ancho * 0.04),
                                        ),
                                        color: checkSize5
                                            ? kPrimaryColor
                                            : Colors.white,
                                      ),
                                      child: checkSize5
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size: ancho * 0.05,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(""),
                                    ),
                                    SizedBox(
                                      width: ancho * 0.01,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: alto * 0.01),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ancho * 0.04),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    checkSize4 = false;
                                    checkSize5 = true;
                                    delicado = "no";
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: alto * 0.02,
                        ),
                        Text(
                          "(nos ayudaría mucho saber)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54, fontSize: ancho * 0.03),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Asegurar Paquete?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: ancho * 0.04),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: alto * 0.01),
                                      child: Text(
                                        "Si",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ancho * 0.04),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ancho * 0.01,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: alto * 0.008),
                                      height: ancho * 0.075,
                                      width: ancho * 0.1,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(ancho * 0.04),
                                          bottomLeft:
                                              Radius.circular(ancho * 0.04),
                                        ),
                                        color: checkSize7
                                            ? kPrimaryColor
                                            : Colors.white,
                                      ),
                                      child: checkSize7
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size: ancho * 0.05,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(""),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    checkSize7 = true;
                                    checkSize8 = false;
                                    seguro = "si";
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: alto * 0.008),
                                      height: ancho * 0.075,
                                      width: ancho * 0.1,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: kPrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(ancho * 0.04),
                                          bottomRight:
                                              Radius.circular(ancho * 0.04),
                                        ),
                                        color: checkSize8
                                            ? kPrimaryColor
                                            : Colors.white,
                                      ),
                                      child: checkSize8
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size: ancho * 0.05,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(""),
                                    ),
                                    SizedBox(
                                      width: ancho * 0.01,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: alto * 0.01),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ancho * 0.04),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    checkSize7 = false;
                                    checkSize8 = true;
                                    seguro = "no";
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: alto * 0.02,
                        ),
                        checkSize8
                            ? SizedBox(
                                width: ancho * 0.3,
                                child: Center(
                                  child: Text(
                                    "Asegura tus paquetes por solo S/.10.00",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ancho * 0.03),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: ancho * 0.3,
                                child: Center(
                                  child: Text(
                                    "Tus Envíos estan Asegurados",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ancho * 0.03),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Tienes alguna observación adicional? (opcional):",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
                child: TextFormField(
                  controller: notasAdicionales,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: const BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                    bottom: BorderSide(width: 1, color: kPrimaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Pago Contra Entrega?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: alto * 0.008),
                            height: ancho * 0.1,
                            width: ancho * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(ancho * 0.05),
                                bottomLeft: Radius.circular(ancho * 0.05),
                              ),
                              color: checkSize9 ? kPrimaryColor : Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              "Si",
                              style: TextStyle(
                                  color:
                                      checkSize9 ? Colors.white : Colors.grey,
                                  fontSize: ancho * 0.04),
                            )),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          checkSize9 = true;
                          checkSize10 = false;
                          contraEntrega = "si";
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: alto * 0.008),
                            height: ancho * 0.1,
                            width: ancho * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(ancho * 0.05),
                                bottomRight: Radius.circular(ancho * 0.05),
                              ),
                              color: checkSize10 ? kPrimaryColor : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "No",
                                style: TextStyle(
                                    color: checkSize10
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: ancho * 0.04),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          checkSize9 = false;
                          checkSize10 = true;
                          contraEntrega = "no";
                        });
                      },
                    ),
                  ),
                ],
              ),
              checkSize10
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: alto * 0.04,
                          top: alto * 0.03,
                          left: ancho * 0.1,
                          right: ancho * 0.1),
                      height: alto * 0.06,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                        ),
                        onPressed: () {
                          opcionesComprobante(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Subir Comprobante',
                              style: TextStyle(
                                  color: Colors.white, fontSize: ancho * 0.05),
                            ),
                            Icon(
                              Icons.camera_alt,
                              size: alto * 0.038,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text(""),
              checkSize10 && imagen == null
                  ? Center(
                      child: Icon(
                        Icons.image,
                        size: ancho * 0.5,
                        color: Colors.black54,
                      ),
                    )
                  : const Text(""),
              !checkSize10
                  ? const Center()
                  : imagen == null
                      ? const Center()
                      : Center(
                          child: Image.file(imagen!),
                        ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Si Tienes algún código Promocional\nIngrésalo a continuación: (opcional)",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: alto * 0.02, left: ancho * 0.2, right: ancho * 0.2),
                child: TextFormField(
                  controller: codigoPromocional,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  expands: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 4, horizontal: ancho * 0.01),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  border: Border.all(width: 1, color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              checkSize9
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: alto * 0.04, top: alto * 0.03),
                      height: alto * 0.06,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                        ),
                        onPressed: () {
                          validarDatosSinComprobante(context);
                        },
                        child: Text(
                          'CREAR DELIVERY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: ancho * 0.04),
                        ),
                      ),
                    )
                  : imagen == null
                      ? Container(
                          margin: EdgeInsets.only(
                              bottom: alto * 0.04, top: alto * 0.03),
                          height: alto * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              Error("Subir la imagen del comprobante", ancho,
                                  context);
                            },
                            child: Text(
                              'CREAR DELIVERY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: ancho * 0.04),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kPrimaryColor),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(
                              bottom: alto * 0.04, top: alto * 0.03),
                          height: alto * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kPrimaryColor),
                            ),
                            onPressed: () {
                              validarDatosConComprobante(context);
                            },
                            child: Text(
                              'CREAR DELIVERY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: ancho * 0.04),
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }

  Future getCostoEnvio(
      String idDistritoEmpresa, String idDistrigoCliente) async {
    String url = "$servidor/Empresa/App_ficha_costo.php";
    var response = await http.post(Uri.parse(url), body: {
      "idDistritoEmpresa": idDistritoEmpresa,
      "idDistrigoCliente": idDistrigoCliente,
    });

    switch (response.statusCode) {
      case 200:
        break;
      case 404:
        Error('404 - Problemas en el servidor!', ancho, context);
        break;
      default:
        Error('Error - Ocurrio algo inesperado!', ancho, context);
        break;
    }
  }

  validarDatosSinComprobante(context) {
    //crearFicha();
    setState(() {
      _nombre = RegExp(
              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
          .hasMatch(nombre.text);
      _apellido = RegExp(
              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
          .hasMatch(apellido.text);
      _correo = correo.text != ""
          ? RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(correo.text)
          : true;
      _documento =
          dni.text != "" ? RegExp(r'^[0-9]{8}$').hasMatch(dni.text) : true;
      _celular = RegExp(r'^[0-9]{9}$').hasMatch(celular.text);
      _direccionDestino =
          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(direccionDestino.text);
      _direccionRecojo =
          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(direccionRecojo.text);
      _referenciaDestino =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(referenciaDestino.text);
      _referenciaRecojo =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(referenciaRecojo.text);
      _distritoDestino = miActualdistritoDestino.contains("-") ? false : true;
      _distritoRecojo = miActualDistritoRecojo.contains("-") ? false : true;
      _producto = RegExp(r'^[^=<>?\/"\\]+$').hasMatch(producto.text);
      _descripcionProducto =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(descripcionProducto.text);
      _notasAdicionales =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(descripcionProducto.text);
    });

    if (_nombre &&
        _apellido &&
        _correo &&
        _documento &&
        _celular &&
        _direccionDestino &&
        _direccionRecojo &&
        _referenciaDestino &&
        _referenciaRecojo &&
        _distritoDestino &&
        _distritoRecojo &&
        _producto &&
        _descripcionProducto &&
        _notasAdicionales) {
      CrearFichaSinComprobante(context);
    } else {
      Error("Verifique los datos ingresados.", ancho, context);
    }
  }

  validarDatosConComprobante(context) {
    //crearFicha();
    setState(() {
      _nombre = RegExp(
              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
          .hasMatch(nombre.text);
      _apellido = RegExp(
              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
          .hasMatch(apellido.text);
      _correo = correo.text != ""
          ? RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(correo.text)
          : true;
      _documento =
          dni.text != "" ? RegExp(r'^[0-9]{8}$').hasMatch(dni.text) : true;
      _celular = RegExp(r'^[0-9]{9}$').hasMatch(celular.text);
      _direccionDestino =
          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(direccionDestino.text);
      _direccionRecojo =
          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(direccionRecojo.text);
      _referenciaDestino =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(referenciaDestino.text);
      _referenciaRecojo =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(referenciaRecojo.text);
      _distritoDestino = miActualdistritoDestino.contains("-") ? false : true;
      _distritoRecojo = miActualDistritoRecojo.contains("-") ? false : true;
      _producto = RegExp(r'^[^=<>?\/"\\]+$').hasMatch(producto.text);
      _descripcionProducto =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(descripcionProducto.text);
      _notasAdicionales =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(descripcionProducto.text);
      _codigoPromocional =
          RegExp(r'^[^=<>?\/"\\]*$').hasMatch(codigoPromocional.text);
    });

    if (_nombre &&
        _apellido &&
        _correo &&
        _documento &&
        _celular &&
        _direccionDestino &&
        _direccionRecojo &&
        _referenciaDestino &&
        _referenciaRecojo &&
        _distritoDestino &&
        _distritoRecojo &&
        _producto &&
        _descripcionProducto &&
        _notasAdicionales &&
        _codigoPromocional &&
        imagen != null) {
      imagenUpload(context);
    } else {
      Error("Verifique los datos ingresados.", ancho, context);
    }
  }

  CrearFichaSinComprobante(BuildContext context) async {
    String url = "$servidor/Empresa/App_ficha_crear.php";

    final Map<String, dynamic> activityData = {
      //destino
      'direccionDestino':
          direccionDestino.text.isEmpty ? "null" : direccionDestino.text,
      'referenciaDestino': referenciaDestino.text.isEmpty
          ? 'Sin referencia'
          : referenciaDestino.text,
      'idDistritoDestino': "${miDistrito.indexOf(miActualdistritoDestino) + 1}",
      //origen
      'direccionRecojo':
          direccionRecojo.text.isEmpty ? "null" : direccionRecojo.text,
      'referenciaRecojo': referenciaRecojo.text.isEmpty
          ? 'Sin referencia'
          : referenciaRecojo.text,
      'idDistritoRecojo': "${miDistrito.indexOf(miActualDistritoRecojo) + 1}",
      //producto
      'producto': producto.text.isEmpty ? "null" : producto.text,
      'delicado': delicado,
      'descripcionProducto': descripcionProducto.text.isEmpty
          ? 'Sin Descripción'
          : descripcionProducto.text,
      'sizeProduct': sizeProduct,
      //comprador
      'nombreComprador': nombre.text.isEmpty ? "null" : nombre.text,
      'apellidoComprador': apellido.text.isEmpty ? "null" : apellido.text,
      'documentoComprador': dni.text.isEmpty ? "null" : dni.text,
      'celularComprador': celular.text.isEmpty ? "null" : celular.text,
      'correoComprador': correo.text.isEmpty ? "null" : correo.text,
      //ficha
      'idTipoEnvio':
          "${widget.item['idtipo'] == '1' ? widget.item['idtipo'] : '2'}",
      'idEmpresa': widget.usuarioEmpresa.empresa.idCuentaEmpresa,
      'estado': 'ASIGNADO',
      'monto': '0',
      'coordOrigen': '0,0',
      'coordDestino': '0,0',
      'km': '0',
      'seguro': seguro == 'si' ? '1' : '0',
      'notasAdicionales': notasAdicionales.text.isEmpty
          ? 'Sin notas Adicionales'
          : notasAdicionales.text,
      'comprobante': "null",
      'promocion': codigoPromocional.text.isEmpty
          ? "0"
          : codigoPromocional.text == 'PROMO5'
              ? '5'
              : codigoPromocional.text == 'PROMO3'
                  ? '3'
                  : '0',
      'codigo': '0',
    };

    final http.Response response =
        await http.post(Uri.parse(url), body: activityData);

    var jsonData = jsonDecode(response.body);
    print("jsonData: $jsonData");
    validarResponse(jsonData);

  }

  crearFichaConComprobante(context, value) async {
    String url = "$servidor/Empresa/App_ficha_crear.php";

    final Map<String, dynamic> activityData = {
      //destino
      'direccionDestino':
      direccionDestino.text.isEmpty ? "null" : direccionDestino.text,
      'referenciaDestino': referenciaDestino.text.isEmpty
          ? 'Sin referencia'
          : referenciaDestino.text,
      'idDistritoDestino': "${miDistrito.indexOf(miActualdistritoDestino) + 1}",
      //origen
      'direccionRecojo':
      direccionRecojo.text.isEmpty ? "null" : direccionRecojo.text,
      'referenciaRecojo': referenciaRecojo.text.isEmpty
          ? 'Sin referencia'
          : referenciaRecojo.text,
      'idDistritoRecojo': "${miDistrito.indexOf(miActualDistritoRecojo) + 1}",
      //producto
      'producto': producto.text.isEmpty ? "null" : producto.text,
      'delicado': delicado,
      'descripcionProducto': descripcionProducto.text.isEmpty
          ? 'Sin Descripción'
          : descripcionProducto.text,
      'sizeProduct': sizeProduct,
      //comprador
      'nombreComprador': nombre.text.isEmpty ? "null" : nombre.text,
      'apellidoComprador': apellido.text.isEmpty ? "null" : apellido.text,
      'documentoComprador': dni.text.isEmpty ? "null" : dni.text,
      'celularComprador': celular.text.isEmpty ? "null" : celular.text,
      'correoComprador': correo.text.isEmpty ? "null" : correo.text,
      //ficha
      'idTipoEnvio':
      "${widget.item['idtipo'] == '1' ? widget.item['idtipo'] : '2'}",
      'idEmpresa': widget.usuarioEmpresa.empresa.idCuentaEmpresa,
      'estado': 'ASIGNADO',
      'monto': '0',
      'coordOrigen': '0,0',
      'coordDestino': '0,0',
      'km': '0',
      'seguro': seguro == 'si' ? '1' : '0',
      'notasAdicionales': notasAdicionales.text.isEmpty
          ? 'Sin notas Adicionales'
          : notasAdicionales.text,
      'comprobante': value,
      'promocion': codigoPromocional.text.isEmpty
          ? "0"
          : codigoPromocional.text == 'PROMO5'
          ? '5'
          : codigoPromocional.text == 'PROMO3'
          ? '3'
          : '0',
      'codigo': '0',
    };

    final http.Response response =
    await http.post(Uri.parse(url), body: activityData);

    var jsonData = jsonDecode(response.body);
    print("jsonData: $jsonData");
    validarResponse(jsonData);

  }

  opcionesComprobante(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // backgroundColor: Colors.transparent,

            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Tomar una foto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: ancho * 0.045),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                            size: alto * 0.035,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(alto * 0.02),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Seleccionar una foto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: ancho * 0.045),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: kPrimaryColor,
                            size: alto * 0.035,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(alto * 0.02),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Regresar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: ancho * 0.045),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(alto * 0.02),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  selImagen(op) async {
    PickedFile? pickedFile;
    if (op == 1) {
      // ignore: deprecated_member_use
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      // ignore: deprecated_member_use
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        Error("No seleccionaste ninguna Foto!", ancho, context);
      }
    });
    Navigator.of(context).pop();
  }

  imagenUpload(context) async {
    String url = "$servidor/Empresa/App_comprobante_subir_imagen.php";
    try {
      String nombreImagen = imagen!.path.split("/").last;
      FormData formdata2 = FormData.fromMap({
        'idUsuario': widget.usuarioEmpresa.idCuentaUsuario,
        'file': await MultipartFile.fromFile(
          imagen!.path,
          filename: nombreImagen,
        ),
      });

      await Dio().post(url, data: formdata2).then((value) {
        if (value.toString() != '1') {
          String nombreImagen = value.toString().split("/").last;
          crearFichaConComprobante(context, nombreImagen);
        } else {
          Error("No se pudo subir la imagen.", ancho, context);
        }
      });
    } catch (e) {
      Error("Error cargando los datos de la imagen.", ancho, context);
    }
  }

  void validarResponse(jsonData) {
    switch (jsonData["0"]) {
      case '0':
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
              title: Container(
                  padding: EdgeInsets.symmetric(horizontal: ancho * 0.1),
                  child: Image.asset("assets/images/logo_qumpa.png")),
              content: SizedBox(
                height: alto * 0.15,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "No hay conexión con el Servidor.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ancho * 0.07),
                      ),
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(bottom: alto * 0.02),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/principalEmpresa',
                          arguments: widget.usuarioEmpresa);
                    },
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: ancho * 0.06,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              elevation: 24,
              backgroundColor: Colors.white,
            ));
        break;
      case '1':
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
              title: Container(
                  padding: EdgeInsets.symmetric(horizontal: ancho * 0.1),
                  child: Image.asset("assets/images/logo_qumpa.png")),
              content: SizedBox(
                height: alto * 0.15,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Se Registro el Delivery Exitosamente!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ancho * 0.07),
                      ),
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(bottom: alto * 0.02),
                  child: TextButton(
                    onPressed: () {

                      Navigator.of(context).pushReplacementNamed(
                          '/principalEmpresa',
                          arguments: widget.usuarioEmpresa);

                    },
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: ancho * 0.06,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              elevation: 24,
              backgroundColor: Colors.white,
            ));
        break;
      default:
        break;
    }
  }
}
