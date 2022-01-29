import 'package:flutter/material.dart';
import 'package:qumpa/Bean/bean_cuenta_usuario.dart';
import 'package:qumpa/Bean/bean_delivery.dart';
import 'package:qumpa/Bean/bean_ficha.dart';

import '../../../../constantes.dart';

class HistorialFinalizadoDetalle extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  final Delivery data;
  const HistorialFinalizadoDetalle(this.usuarioEmpresa, this.data, {Key? key})
      : super(key: key);
  @override
  _HistorialFinalizadoDetalleState createState() =>
      _HistorialFinalizadoDetalleState();
}

class _HistorialFinalizadoDetalleState
    extends State<HistorialFinalizadoDetalle> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;
  late String miurl = "";
  final _keyCrearEnvio = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("$servidor/ImgEntregas/${widget.data.foto}");
    setState(() {
      miurl = "$servidor/ImgEntregas/${widget.data.foto}";
    });
    print("urlImgEntrega: $miurl");
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
              rowTextPerfil("Celular:", widget.data.datosFicha.celularComprador),
              SizedBox(height: alto * 0.02),
              rowTextPerfil(
                  "Dirección de Entrega:", widget.data.datosFicha.direccionDestino),
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
                "Datos donde se recogió:",
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
              rowTextPerfil(
                  "Dirección de Recojo:", widget.data.datosFicha.direccionRecojo),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil(
                  "Distrito de Recojo:",miDistrito[int.parse(widget.data.datosFicha.DistritoRecojo)-1]),

              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Datos de lo que se Envió:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Paquete:", widget.data.datosFicha.producto),
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
              rowTextPerfil(
                  "Solicitó seguro Qumpa?:", widget.data.datosFicha.seguro=='1'?'si':'no'),
              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Datos del Conductor:",
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
                  "${widget.data.vehiculo.chofer.datosPersonales.nombre} ${widget.data.vehiculo.chofer.datosPersonales.apellido}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Celular:",
                  "${widget.data.vehiculo.chofer.datosPersonales.celular}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Documento:",
                  "${widget.data.vehiculo.chofer.datosPersonales.dni}"),
              SizedBox(
                height: alto * 0.04,
              ),
              Text(
                "Datos del Vehiculo:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Marca:", "${widget.data.vehiculo.marca}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Modelo:", "${widget.data.vehiculo.modelo}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Placa:", "${widget.data.vehiculo.numPlaca}"),
              SizedBox(
                height: alto * 0.02,
              ),
              rowTextPerfil("Color:", "${widget.data.vehiculo.colorVehiculo}"),
              SizedBox(
                height: alto * 0.06,
              ),

              widget.data.foto.isNotEmpty
                  ? Center(
                child: Image.network(
                  miurl,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.do_not_disturb);
                  },
                ),

              )
                  : Row(
                children: [
                  Icon(Icons.warning_rounded,size: ancho*0.1,color: kPrimaryColor,),
                  SizedBox(width: ancho*0.04,),
                  Expanded(
                    child: Text(
                      "No se pudo Cargar La imagen de la entrega",
                      style: TextStyle(
                          fontSize: ancho * 0.05,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

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
                    Navigator.of(context).pushReplacementNamed(
                        '/principalEmpresa',
                        arguments: widget.usuarioEmpresa);
                  },
                  child: Text(
                    'REGRESAR',
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
}
