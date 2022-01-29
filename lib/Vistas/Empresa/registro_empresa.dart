import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../constantes.dart';

class RegistroEmpresa extends StatefulWidget {
  const RegistroEmpresa({Key? key}) : super(key: key);
  @override
  _RegistroEmpresaState createState() => _RegistroEmpresaState();
}

class _RegistroEmpresaState extends State<RegistroEmpresa> {
  bool _nombreComercial = true;
  bool _ruc = true;
  bool _correo = true;
  bool _direccion = true;
  bool _distrito = true;
  bool _descripcion = true;
  bool _categoria = true;
  bool _misEnvios = true;

  bool _nombre = true;
  bool _apellido = true;
  bool _documento = true;
  bool _celular = true;

  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  final _keyCrearEnvio = GlobalKey<FormState>();

  final TextEditingController nombreComercial = TextEditingController();
  final TextEditingController ruc = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  late String miActualDistrito = "- - Seleccionar Distrito - -";
  final TextEditingController descripcion = TextEditingController();
  String miActualCategoria = "--Seleccionar--";
  String miNumEnviosActual = "--Seleccionar--";
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellido = TextEditingController();
  final TextEditingController dni = TextEditingController();
  final TextEditingController celular = TextEditingController();

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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: alto * 0.02),
                      child: Text(
                        "Registro QUMPA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ancho * 0.06,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/icons/icon_tienda.png",
                  width: ancho * 0.4,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Datos de la empresa:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Nombre Comercial:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          height: alto * 0.06,
                          child: TextFormField(
                            controller: nombreComercial,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _nombreComercial
                                      ? kPrimaryColor
                                      : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _nombreComercial
                                      ? kPrimaryColor
                                      : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
                            "Ruc (11-digitos):",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: TextFormField(
                            controller: ruc,
                            textAlign: TextAlign.left,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _ruc ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _ruc ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
              //input correo
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "E-mail:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: alto * 0.06,
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
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _correo ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _correo ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
              //input direccion
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Dirección:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: TextFormField(
                            controller: direccion,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _direccion ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _direccion ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
                "Distrito:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(left: ancho * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _distrito ? kPrimaryColor : Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text(
                    miActualDistrito,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: ancho * 0.06),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: _distrito ? kPrimaryColor : Colors.red,
                  ),
                  iconSize: ancho * 0.14,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ancho * 0.06,
                  ),
                  //value: miActualDistrito??'-- Seleccionar Distrito --',
                  onChanged: (newValue) {
                    setState(() {
                      miActualDistrito = newValue as String;
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
                                    color:
                                        _distrito ? kPrimaryColor : Colors.red),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              SizedBox(
                height: alto * 0.02,
              ),

              //input descripcion de la empresa
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Breve Descripcion de la empresa:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: alto * 0.06,
                          child: TextFormField(
                            controller: descripcion,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _descripcion ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _descripcion ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categoría:",
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: alto * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: ancho * 0.04),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _categoria ? kPrimaryColor : Colors.red,
                                width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text(
                              miActualCategoria,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: ancho * 0.04),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: _categoria ? kPrimaryColor : Colors.red,
                            ),
                            iconSize: ancho * 0.14,
                            isExpanded: true,
                            underline: const SizedBox(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ancho * 0.04,
                            ),
                            //value: miActualDistrito??'-- Seleccionar Distrito --',
                            onChanged: (newValue) {
                              setState(() {
                                miActualCategoria = newValue as String;
                              });
                            },
                            items: miCategoria
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
                                              color: _categoria
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ancho * 0.04,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Num. Envíos mensuales:",
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: alto * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: ancho * 0.04),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _misEnvios ? kPrimaryColor : Colors.red,
                                width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text(
                              miNumEnviosActual,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: ancho * 0.04),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: _misEnvios ? kPrimaryColor : Colors.red,
                            ),
                            iconSize: ancho * 0.14,
                            isExpanded: true,
                            underline: const SizedBox(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ancho * 0.04,
                            ),
                            //value: miActualDistrito??'-- Seleccionar Distrito --',
                            onChanged: (newValue) {
                              setState(() {
                                miNumEnviosActual = newValue as String;
                              });
                            },
                            items: miCantEnvios
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
                                              color: _categoria
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Persona a cargo de la cuenta:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Nombre:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          height: alto * 0.06,
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
                              hintText: "",
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _nombre ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _nombre ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: Text(
                            "Apellido:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          height: alto * 0.06,
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
                              hintText: "",
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _apellido ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _apellido ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: alto * 0.01,
                                  horizontal: ancho * 0.01),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Documento (DNI):",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: ancho * 0.01, top: alto * 0.01),
                          //height: alto * 0.07,
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
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
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
                              left: ancho * 0.01, top: alto * 0.01),
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
                ],
              ),
              SizedBox(
                height: alto * 0.04,
              ),

              SizedBox(
                height: alto * 0.04,
              ),
              Container(
                margin: EdgeInsets.only(bottom: alto * 0.07),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    setState(() {
                      _nombreComercial = RegExp(
                              r"^[a-z'0-9A-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-z'0-9A-ZÀ-ÿ\u00f1\u00d1]*)*[a-z'0-9A-ZÀ-ÿ\u00f1\u00d1]*$")
                          .hasMatch(nombreComercial.text);
                      _ruc = ruc.text.length == 11;
                      _correo = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(correo.text);
                      _nombre = RegExp(
                              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
                          .hasMatch(nombre.text);
                      _apellido = RegExp(
                              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
                          .hasMatch(apellido.text);
                      _documento = dni.text.length == 8 ? true : false;
                      _celular = celular.text.length == 9 ? true : false;

                      _direccion =
                          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(direccion.text);
                      _descripcion =
                          RegExp(r'^[^=<>?\/"\\]+$').hasMatch(descripcion.text);
                      _distrito = miActualDistrito.contains("-") ? false : true;
                      _misEnvios = miNumEnviosActual.contains("-") ? false : true;
                      _categoria = miActualCategoria.contains("-") ? false : true;
                    });

                    if (_nombreComercial &&
                        _ruc &&
                        _correo &&
                        _direccion &&
                        _distrito&&
                        _descripcion&&
                        _categoria&&
                        _misEnvios&&
                        _nombre&&
                        _apellido &&
                        _documento &&
                        _celular ) {
                      registroEmpresa();
                    } else {
                      Error("Verifique los datos ingresados.", ancho, context);
                    }
                  },
                  child: Text(
                    'REGISTRAR EMPRESA',
                    style:
                        TextStyle(color: Colors.white, fontSize: ancho * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registroEmpresa() async {
    String url = "$servidor/Empresa/App_registro.php";
    var response = await post(Uri.parse(url), body: {
      'nombreComercial': nombreComercial.text,
      'ruc': ruc.text,
      'correo': correo.text,
      'direccion': direccion.text,
      'miActualDistrito': miActualDistrito,
      'descripcion': descripcion.text,
      'miActualCategoria': '${miCategoria.indexOf("${miActualCategoria}") + 1}',
      'miNumEnviosActual':
          '${miCantEnvios.indexOf("${miNumEnviosActual}") + 1}',
      'nombre': nombre.text,
      'apellido': apellido.text,
      'dni': dni.text,
      'celular': celular.text
    });
    print("response: $response");
    print("response.statusCode: ${response.statusCode}");
    print("response.body: ${response.body}");

    var data = jsonDecode(response.body);
    print(data);
    print(data["0"]);
    if (data["0"] == "1") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registro Exitoso!\nBienvenido a la familia QUMPA!!")));

//redireccionar

      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Este correo ya ha sido Registrado.\nNos pondremos en contacto con usted!")));
    }
  }
}
