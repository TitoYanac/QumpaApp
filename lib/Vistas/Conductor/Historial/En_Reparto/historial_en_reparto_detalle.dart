import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qumpa/Bean/bean_cuenta_usuario.dart';
import 'package:qumpa/Bean/bean_delivery.dart';

import '../../../../constantes.dart';

class HistorialConductorEnRepartoDetalle extends StatefulWidget {
  final CuentaUsuario usuarioConductor;
  final Delivery data;
  const HistorialConductorEnRepartoDetalle(this.usuarioConductor, this.data,
      {Key? key})
      : super(key: key);
  @override
  _HistorialConductorEnRepartoDetalleState createState() =>
      _HistorialConductorEnRepartoDetalleState();
}

class _HistorialConductorEnRepartoDetalleState
    extends State<HistorialConductorEnRepartoDetalle> {
  File? imagen;
  final picker = ImagePicker();

  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  final TextEditingController nota = TextEditingController();

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
                              '/principalConductor',
                              arguments: widget.usuarioConductor);
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
                    widget.data.datosFicha.idTipoEnvio == "1"
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
                    "${int.parse(widget.data.datosFicha.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) > 12 ? int.parse(widget.data.datosFicha.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) - 12 : int.parse(widget.data.datosFicha.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single)} : ${int.parse(widget.data.datosFicha.fechaCreacion.split(" ").last.split(":").sublist(1, 2).single)} ${int.parse(widget.data.datosFicha.fechaCreacion.split(" ").last.split(":").sublist(0, 1).single) > 12 ? "pm":"am"}\n"
                        "${int.parse(widget.data.datosFicha.fechaCreacion.split(" ").first.split("-").sublist(2, 3).single)} de ${miMes[int.parse(widget.data.datosFicha.fechaCreacion.split(" ").first.split("-").sublist(1, 2).single)-1]}",
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
                  "${widget.data.datosFicha.nombreComprador} ${widget.data.datosFicha.apellidoComprador}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Documento de Identidad (DNI):",
                  widget.data.datosFicha.documentoComprador),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Celular:", widget.data.datosFicha.celularComprador),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Dirección de Entrega:",
                  widget.data.datosFicha.direccionDestino),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Distrito de Entrega:",
                  miDistrito[
                      int.parse(widget.data.datosFicha.idDistritoDestino) - 1]),
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
              rowTextPerfil("Nombre comercial:",
                  widget.data.datosFicha.nombreEmpresaOrigen),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Ruc:", widget.data.datosFicha.rucEmpresa),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Dirección de Recojo:",
                  widget.data.datosFicha.direccionRecojo),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Distrito de Recojo:",miDistrito[int.parse(widget.data.datosFicha.DistritoRecojo)-1]),
              SizedBox(height: alto * 0.04),
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
              rowTextPerfil(
                  "Contenido del delivery:", widget.data.datosFicha.producto),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Descripcion:", widget.data.datosFicha.descripcionProducto),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("¿Es delicado?:", widget.data.datosFicha.delicado),
              SizedBox(height: alto * 0.02),
              rowTextPerfil(
                  "Tamaño del paquete:", widget.data.datosFicha.sizeProduct),
              SizedBox(height: alto * 0.02),
              rowTextPerfil("Solicitó seguro Qumpa?:",
                  widget.data.datosFicha.seguro == '1' ? 'si' : 'no'),
              SizedBox(
                height: alto * 0.06,
              ),
              imagen == null
                  ? Center(
                      child: Icon(
                        Icons.image,
                        size: ancho * 0.5,
                        color: Colors.black54,
                      ),
                    )
                  : const Text(""),
              imagen == null
                  ? const Center()
                  : Center(
                      child: Image.file(imagen!),
                    ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      formAlmacen(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          size: ancho * 0.08,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: ancho * 0.04,
                        ),
                        Text(
                          'Almacén',
                          style: TextStyle(
                              color: Colors.white, fontSize: ancho * 0.05),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor),
                    ),
                    onPressed: () {
                      opImagenEntrega(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: ancho * 0.08,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: ancho * 0.04,
                        ),
                        Text(
                          'Foto',
                          style: TextStyle(
                              color: Colors.white, fontSize: ancho * 0.05),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              imagen == null
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: alto * 0.04, top: alto * 0.03),
                      height: alto * 0.06,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          Error(
                              "Subir la imagen de la Entrega", ancho, context);
                        },
                        child: Text(
                          'FINALIZAR DELIVERY',
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
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                        ),
                        onPressed: () {
                          imagenUpload(context);
                        },
                        child: Text(
                          'FINALIZAR DELIVERY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: ancho * 0.04),
                        ),
                      ),
                    ),
              SizedBox(
                height: alto * 0.02,
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

  opImagenEntrega(BuildContext context) {
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

  formAlmacen(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // backgroundColor: Colors.transparent,
            title: Text(
              "Motivo:",
              style: TextStyle(
                fontSize: ancho * 0.05,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: alto * 0.04,
                    ),
                    Container(
                      height: alto*0.12,
                      margin: EdgeInsets.only(
                          right: ancho * 0.04,left: ancho*0.04, top: alto * 0.01),
                      padding: EdgeInsets.only(
                        right: ancho * 0.04,left: ancho*0.04,top: alto*0.04),
                      child: TextFormField(
                        controller: nota,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        expands: false,
                        enableSuggestions: false,
                        style: TextStyle(
                          fontSize: ancho * 0.05,
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
                        color: Colors.black12,
                        //color: Colors.red,
                        border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: alto * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if(nota.text.isEmpty){
                              Error("Ingrese un motivo para enviar al almacén", ancho, context);
                              }
                              else{
                                almacenDelivery(context);
                              }
                            },
                            child: Container(
                              child: Text(
                                "Almacén",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ancho * 0.045),
                              ),
                              padding: EdgeInsets.all(alto * 0.02),
                              decoration: const BoxDecoration(
                                color: kPrimaryColor
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
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
                                          color: Colors.white,
                                          fontSize: ancho * 0.045),
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(alto * 0.02),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  imagenUpload(context) async {
    String url = "$servidor/Conductor/App_entrega_subir_imagen.php";
    try {
      String nombreImagen = imagen!.path.split("/").last;
      FormData formdata = FormData.fromMap({
        'idUsuario': widget.usuarioConductor.idCuentaUsuario,
        'file': await MultipartFile.fromFile(
          imagen!.path,
          filename: nombreImagen,
        ),
      });

      await Dio().post(url, data: formdata).then((value) {
        if (value.toString() != '1') {
          String nombreImagen = value.toString().split("/").last;
          FinalizarDelivery(context, nombreImagen);
        } else {
          Error("No se pudo subir la imagen.", ancho, context);
        }
      });
    } catch (e) {
      Error("Error cargando los datos de la imagen.", ancho, context);
    }
  }

  FinalizarDelivery(context, String nombreImagen) async {
    String url = "$servidor/Conductor/App_finalizar_envio_en_Reparto.php";

    final response = await http.post(Uri.parse(url), body: {
      "id_ficha": widget.data.datosFicha.idFicha,
      "nombreImagen": nombreImagen,
    });

    if (response.statusCode == 404) {
      Error(
        'Aplicación en Mantenimiento\nEspere unos minutos y vuelva a intentar.',
        ancho,
        context,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/principalConductor',
          arguments: widget.usuarioConductor);
    }
  }

  almacenDelivery(context) async {
    String url = "$servidor/Conductor/App_envio_a_almacen.php";

    final response = await http.post(Uri.parse(url), body: {
      "idEntrega": widget.data.idEntrega,
      "nota": nota.text,
      "estado": 'ALMACEN',
      "idFicha": widget.data.datosFicha.idFicha,
    });

    if (response.statusCode == 404) {
      Error(
        'Aplicación en Mantenimiento\nEspere unos minutos y vuelva a intentar.',
        ancho,
        context,
      );
    } else {

      Navigator.of(context).pushReplacementNamed('/principalConductor',
          arguments: widget.usuarioConductor);

    }
  }
}
