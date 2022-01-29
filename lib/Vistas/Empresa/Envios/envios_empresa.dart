import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';
import 'envios_empresa_detalle.dart';
import '../../../constantes.dart';

class EnviosEmpresa extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  const EnviosEmpresa(this.usuarioEmpresa, {Key? key}) : super(key: key);

  @override
  _EnviosEmpresaState createState() => _EnviosEmpresaState();
}

class _EnviosEmpresaState extends State<EnviosEmpresa> {
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
    return ListView(
      children: [
        SizedBox(
          height: alto * 0.03,
        ),
        Center(
            child: Text(
          "Elige el tipo de Servicio",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: ancho * 0.06),
        )),
        SizedBox(
          height: alto * 0.01,
        ),
        Center(
            child: Text(
          "Que más te conviene",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: ancho * 0.06),
        )),
        SizedBox(
          height: alto * 0.02,
        ),
        for (var item in tiposDeEnvio)
          Container(
            padding: EdgeInsets.symmetric(vertical: alto * 0.01),
            margin: EdgeInsets.symmetric(
                horizontal: ancho * 0.04, vertical: alto * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.0,
                color: kSecondaryColor,
              ),
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              leading: Image.asset(
                "${item['icon']}",
                width: ancho * 0.16,
              ),
              title: Text(
                "${item['tipo']}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: ancho * 0.04),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: alto * 0.005),
                    child: Text(
                      "${item['text']}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: ancho * 0.032),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${item['tiempo']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ancho * 0.032),
                    ),
                  ),
                ],
              ),
              dense: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EnviosEmpresaDetalle(widget.usuarioEmpresa, item)),
                );
              },
            ),
          ),
      ],
    );
  }
}
