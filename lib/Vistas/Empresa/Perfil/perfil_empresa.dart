import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Bean/bean_cuenta_usuario.dart';

import '../../../constantes.dart';

class PerfilEmpresa extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const PerfilEmpresa(this.cuentaUsuario, {Key? key}) : super(key: key);
  @override
  _PerfilEmpresaState createState() => _PerfilEmpresaState();
}

class _PerfilEmpresaState extends State<PerfilEmpresa> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ancho * 0.06),
      child: ListView(
        children: <Widget>[
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
          rowTextPerfil(
              "Nombre comercial", widget.cuentaUsuario.empresa.nombreComercial),
          SizedBox(height: alto * 0.02),
          rowTextPerfil("Ruc", widget.cuentaUsuario.empresa.ruc),
          SizedBox(height: alto * 0.02),
          rowTextPerfil("E-mail:", widget.cuentaUsuario.correo),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Dirección:",
              widget.cuentaUsuario.empresa.ubicacionEmpresa.direccion),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil(
              "Distrito:",
              miDistrito[int.parse(widget
                      .cuentaUsuario.empresa.ubicacionEmpresa.idDistrito) -
                  1]),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Descripción de la empresa:",
              widget.cuentaUsuario.empresa.descripcion),
          SizedBox(
            height: alto * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: rowTextPerfil(
                    "Categoría:",
                    miCategoria[
                        int.parse(widget.cuentaUsuario.empresa.categoria) - 1]),
              ),
              SizedBox(
                width: ancho * 0.04,
              ),
              Expanded(
                child: rowTextPerfil("Num.Envíos mensuales:",
                    widget.cuentaUsuario.empresa.numEnviosMensuales),
              ),
            ],
          ),
          SizedBox(
            height: alto * 0.04,
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
            children: [
              Expanded(
                child: rowTextPerfil(
                    "Nombre:", widget.cuentaUsuario.persona.nombre),
              ),
              SizedBox(
                width: ancho * 0.04,
              ),
              Expanded(
                child: rowTextPerfil(
                    "Apellido:", widget.cuentaUsuario.persona.apellido),
              ),
            ],
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: rowTextPerfil(
                    "Documento (DNI):", widget.cuentaUsuario.persona.dni),
              ),
              SizedBox(
                width: ancho * 0.04,
              ),
              Expanded(
                child: rowTextPerfil(
                    "Celular:", widget.cuentaUsuario.persona.celular),
              ),
            ],
          ),
          SizedBox(
            height: alto * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.warning_rounded,
                  size: ancho * 0.12,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                width: ancho * 0.04,
              ),
              Expanded(
                child: Text(
                  "Importante!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: ancho * 0.07),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: alto * 0.02, bottom: alto * 0.06),
            child: Text(
              "Para modificar sus datos, póngase en contacto con Qumpa a través de nuestras redes sociales o la pagina web.",
              style: TextStyle(fontSize: ancho * 0.05, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowTextPerfil(String etiqueta, String valor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                etiqueta,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: ancho * 0.04,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ancho * 0.01),
                height: alto * 0.04,
                width: ancho,
                child: Text(
                  valor,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: ancho * 0.04,
                    color: Colors.black54,
                  ),
                ),
                decoration: const BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                    bottom: BorderSide(width: 1, color: kPrimaryColor),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        )
      ],
    );
  }
}
