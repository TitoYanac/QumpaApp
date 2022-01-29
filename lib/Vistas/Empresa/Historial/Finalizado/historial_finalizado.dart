import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qumpa/Bean/bean_conductor.dart';
import 'package:qumpa/Bean/bean_delivery.dart';
import 'package:qumpa/Bean/bean_empresa.dart';
import 'package:qumpa/Bean/bean_ficha.dart';
import 'package:qumpa/Bean/bean_persona.dart';
import 'package:qumpa/Bean/bean_producto.dart';
import 'package:qumpa/Bean/bean_ubicacion.dart';
import 'package:qumpa/Bean/bean_vehiculo.dart';
import '../../../../Bean/bean_cuenta_usuario.dart';
import '../../../../constantes.dart';
import 'historial_finalizado_detalle.dart';

class HistorialFinalizado extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  const HistorialFinalizado(this.usuarioEmpresa, {Key? key}) : super(key: key);

  @override
  _HistorialFinalizadoState createState() => _HistorialFinalizadoState();
}

class _HistorialFinalizadoState extends State<HistorialFinalizado> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  late List<Delivery> misDeliverys = [];

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

    return FutureBuilder(
      future: cargarEnviosEnReparto(widget.usuarioEmpresa, ancho, context),
      builder: (context, response) {
        if (response.connectionState == ConnectionState.done) {
          var body = response.data;
          var aux = jsonEncode(body);
          var data = jsonDecode(aux);

          if (data[0]['FALSE'] != '0' && data[0]['FALSE'] != '1') {
            guardarListaDeFichas(data);
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(alto * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: kSecondaryColor.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    constraints: BoxConstraints(minHeight: alto * 0.1),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: alto * 0.01, horizontal: ancho * 0.04),
                      leading: Container(
                        height: alto * 0.2,
                        width: ancho * 0.18,
                        constraints: BoxConstraints(minHeight: alto * 0.2),
                        child: Image.asset(
                          data[index]['idTipoEnvio'] == "1"?
                          "${tiposDeEnvio[0]['icon']}"
                              :"${tiposDeEnvio[1]['icon']}",
                          height: alto * 0.2,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        "${data[index]['nombreComprador'].toUpperCase()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ancho * 0.04),
                      ),
                      subtitle: Container(
                        constraints: BoxConstraints(minHeight: alto * 0.06),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${data[index]['producto']}",
                                style: TextStyle(
                                  fontSize: ancho * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing:
                      fechadeCreacion("${data[index]['fechaCreacion']}"),
                      dense: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistorialFinalizadoDetalle(
                                  widget.usuarioEmpresa, misDeliverys[index])),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (data[0]['FALSE'] == '0') {
            return Center(
              child: Text(
                "No hay envíos en Proceso.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: ancho * 0.06, color: Colors.black54),
              ),
            );
          } else if (data[0]['FALSE'] == '1') {
            return Center(
              child: Text(
                "No se pudo Establecer Conexión",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: ancho * 0.06, color: Colors.black54),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Ocurrió Algo inesperado!\nEstamos trabajando para volver con el servicio.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: ancho * 0.06, color: Colors.black54),
              ),
            );
          }
        } else {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),
            ),
          );
        }
      },
    );
  }

  Future cargarEnviosEnReparto(CuentaUsuario miUsuario, ancho, context) async {
    String url = "$servidor/Empresa/App_envios_realizados.php";

    final response = await http.post(Uri.parse(url), body: {
      "id_Empresa": miUsuario.idCuentaUsuario,
    });

    print(response.statusCode == 404);
    print(response.body);
    if (response.statusCode == 404) {
      Error(
        'Aplicación en Mantenimiento\nEspere unos minutos y vuelva a intentar.',
        ancho,
        context,
      );
    }
    return jsonDecode(response.body);
  }

  fechadeCreacion(String s) {
    var aux = s.split(" ");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${aux[1]}",
          style: TextStyle(
            fontSize: ancho * 0.04,
          ),
        ),
        Text(
          "${aux[0]}",
          style: TextStyle(
            fontSize: ancho * 0.04,
          ),
        ),
      ],
    );
  }

  void guardarListaDeFichas(data) {
    for (var entrega in data) {
      Persona datosPersonalesConductor = Persona(
        entrega['idChofer'] ?? "null",
        entrega['nombreConductor'] ?? "null",
        entrega['apellidoConductor'] ?? "null",
        entrega['documentoConductor'] ?? "null",
        entrega['celularConductor'] ?? "null",
        Ubicacion("null", "null", "null", "null", "null"),
      );

      Conductor chofer = Conductor(
        entrega['idChofer'] ?? "null",
        entrega['tuc'] ?? "null",
        entrega['numLicencia'] ?? "null",
        entrega['fecExpedicionLic'] ?? "null",
        entrega['imagenPoliza'] ?? "null",
        entrega['fecVencSoat'] ?? "null",
        entrega['imagenTuc'] ?? "null",
        datosPersonalesConductor,
      );
      Vehiculo vehiculo = Vehiculo(
        entrega['idVehiculo'] ?? "null",
        entrega['numPlaca'] ?? "null",
        entrega['colorVehiculo'] ?? "null",
        entrega['anotaciones'] ?? "null",
        entrega['placaVigente'] ?? "null",
        entrega['placaAnterior'] ?? "null",
        entrega['marca'] ?? "null",
        entrega['modelo'] ?? "null",
        entrega['estadoVehiculo'] ?? "null",
        chofer,
      );

      Ficha miFichaactual = Ficha(
        entrega['idFicha'] ?? "null",
        entrega['direccionDestino'] ?? "null",
        entrega['referenciaDestino'] ?? "null",
        entrega['idDistritoDestino'] ?? "null",
        entrega['direccionRecojo'] ?? "null",
        entrega['referenciaRecojo'] ?? "null",
        entrega['idDistritoRecojo'] ?? "null",
        entrega['producto'] ?? "null",
        entrega['delicado'] ?? "null",
        entrega['descripcionProducto'] ?? "null",
        entrega['sizeProduct'] ?? "null",
        entrega['nombreComprador'] ?? "null",
        entrega['apellidoComprador'] ?? "null",
        entrega['documentoComprador'] ?? "null",
        entrega['celularComprador'] ?? "null",
        entrega['correoComprador'] ?? "null",
        entrega['idTipoEnvio'] ?? "null",
        entrega['idEmpresa'] ?? "null",
        entrega['estado'] ?? "null",
        entrega['monto'] ?? "null",
        entrega['coordOrigen'] ?? "null",
        entrega['coordDestino'] ?? "null",
        entrega['km'] ?? "null",
        entrega['seguro'] ?? "null",
        entrega['notasAdicionales'],
        entrega['comprobante'] ?? "null",
        entrega['promocion'] ?? "null",
        entrega['codigo'] ?? "null",
        entrega['fechaCreacion'] ?? "null",
        entrega['nombreEmpresaOrigen'] ?? "null",
        entrega['rucEmpresa'] ?? "null",
      );

      Delivery delivery = Delivery(
        entrega['idEntrega'] ?? "null",
        vehiculo,
        miFichaactual,
        entrega['fechaRecepcion'] ?? "null",
        entrega['fechaEntrega'] ?? "null",
        entrega['foto'] ?? "null",
      );

      misDeliverys.add(delivery);
    }
  }
}
