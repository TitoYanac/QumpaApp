import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qumpa/Bean/bean_cuenta_usuario.dart';
import 'package:qumpa/Bean/bean_ficha.dart';
import 'package:http/http.dart' as http;

import '../../../../constantes.dart';

class HistorialEnEsperaDetalle extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  final Ficha data;
  const HistorialEnEsperaDetalle(this.usuarioEmpresa, this.data, {Key? key})
      : super(key: key);
  @override
  _HistorialEnEsperaDetalleState createState() =>
      _HistorialEnEsperaDetalleState();
}

class _HistorialEnEsperaDetalleState extends State<HistorialEnEsperaDetalle> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  final _keyCrearEnvio = GlobalKey<FormState>();

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
      body: Form(
        key: _keyCrearEnvio,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ancho * 0.06),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: alto * 0.04,
              ),
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
                      child: InkWell(
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
              SizedBox(
                height: alto * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tipo de Servicio:",
                    style: TextStyle(
                      fontSize: ancho * 0.06,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.data.idTipoEnvio == "1"
                        ? "${tiposDeEnvio[0]["tipo"].toString().toUpperCase()}"
                        : "${tiposDeEnvio[1]["tipo"].toString().toUpperCase()}",
                    style: TextStyle(
                      fontSize: ancho * 0.06,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Fecha Creación:",
                    style: TextStyle(
                      fontSize: ancho * 0.06,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${int.parse(widget.data.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) > 12 ? int.parse(widget.data.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) - 12 : int.parse(widget.data.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single)} : ${int.parse(widget.data.fechaCreacion.split(" ").last.split(":").sublist(1, 2).single)} ${int.parse(widget.data.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) > 12 ? "pm":"am"}\n"
                    "${int.parse(widget.data.fechaCreacion.split(" ").first.split("-").sublist(2, 3).single)} de ${miMes[int.parse(widget.data.fechaCreacion.split(" ").first.split("-").sublist(1, 2).single)-1]}",
                    textAlign: TextAlign.right,
                    style: TextStyle(

                      fontSize: ancho * 0.04,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: alto * 0.04),
              Text(
                "Datos del Cliente:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Nombre completo:",
                  "${widget.data.nombreComprador} ${widget.data.apellidoComprador}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Documento de Identidad (DNI):",
                  widget.data.documentoComprador),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Celular:", widget.data.celularComprador),
              SizedBox(height: alto * 0.02),
              rowTextPerfil(
                  "Dirección de Entrega:", widget.data.direccionDestino),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Distrito de Entrega:",
                  miDistrito[int.parse(widget.data.idDistritoDestino) - 1]),
              SizedBox(
                height: alto * 0.02,
              ),
              SizedBox(height: alto * 0.02),
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
                  "Nombre comercial:", widget.data.nombreEmpresaOrigen),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Ruc:", widget.data.rucEmpresa),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Dirección de Recojo:", widget.data.direccionRecojo),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Distrito de Recojo:",miDistrito[int.parse(widget.data.DistritoRecojo)-1]),
              SizedBox(height: alto * 0.02),
              SizedBox(height: alto * 0.02),
              Text(
                "Datos de lo que se Envía:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Contenido del delivery:", widget.data.producto),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Descripcion:", widget.data.descripcionProducto),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("¿Es delicado?:", widget.data.delicado),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Tamaño del paquete:", widget.data.sizeProduct),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Solicitó seguro Qumpa?:",
                  widget.data.seguro == '1' ? 'si' : 'no'),
              SizedBox(
                height: alto * 0.06,
              ),
              Container(
                margin: EdgeInsets.only(bottom: alto * 0.04),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ancho * 0.1),
                                  child: Image.asset(
                                      "assets/images/logo_qumpa.png")),
                              content: Container(
                                height: alto * 0.15,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Una vez cancelado el servicio, los datos del envío no se podrán recuperar.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: ancho * 0.05),
                                    ),
                                    Text(
                                      "Deseas continuar?",
                                      style: TextStyle(
                                          fontSize: ancho * 0.05,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: [
                                Container(
                                  color: kPrimaryColor,
                                  margin: EdgeInsets.only(bottom: alto * 0.02),
                                  child: TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                        fontSize: ancho * 0.06,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.red,
                                  margin: EdgeInsets.only(bottom: alto * 0.02),
                                  child: TextButton(
                                    onPressed: () {
                                      cancelarServicio(widget.data.idFicha);
                                    },
                                    child: Text(
                                      "Sí",
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
                  },
                  child: Text(
                    'CANCELAR SERVICIO',
                    style:
                        TextStyle(color: Colors.white, fontSize: ancho * 0.04),
                  ),
                ),
              ),
              SizedBox(
                height: alto * 0.04,
              ),
            ],
          ),
        ),
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
                margin: EdgeInsets.only(right: ancho * 0.01, top: alto * 0.01),
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
                      bottom: BorderSide(width: 1, color: kPrimaryColor)),
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

  Future cancelarServicio(String idFicha) async {
    String url = "$servidor/Empresa/App_ficha_eliminar.php";
    var response = await http.post(Uri.parse(url), body: {'idFicha': idFicha});

    print(response.body);
    var data = jsonDecode(response.body);
    print(data["0"]);

    Navigator.of(context).pushReplacementNamed('/principalEmpresa',
        arguments: widget.usuarioEmpresa);
  }
}
