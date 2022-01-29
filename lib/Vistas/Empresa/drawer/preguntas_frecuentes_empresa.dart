import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';
import '../../../constantes.dart';

class PreguntasFrecuentesEmpresa extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const PreguntasFrecuentesEmpresa(this.cuentaUsuario, {Key? key})
      : super(key: key);
  @override
  _PreguntasFrecuentesEmpresaState createState() =>
      _PreguntasFrecuentesEmpresaState();
}

class _PreguntasFrecuentesEmpresaState
    extends State<PreguntasFrecuentesEmpresa> {
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
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: alto * 0.04, horizontal: ancho * 0.03),
        children: [
          SizedBox(
            height: alto * 0.02,
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
                  right: ancho * 0.04,
                  top: 0,
                  child: GestureDetector(
                    child: Container(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: ancho * 0.1,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/principalEmpresa',
                          arguments: widget.cuentaUsuario);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Center(
            child: Text(
              "Preguntas Frecuentes",
              style: TextStyle(fontSize: ancho * 0.06,fontWeight: FontWeight.bold,),
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Container(
            width: ancho,
            height: 2,
            color: kPrimaryColor,
            margin: EdgeInsets.symmetric(horizontal: ancho * 0.04),
          ),
          Pegunta("¿Qué es QUMPA?"),
          Respuesta(
              "Dealer es una Startup especialista en la entrega de paquetería de última milla."),
          Pegunta("¿Quién puede pedir nuestro servicio?"),
          Respuesta(
              "Nuestro servicio está dirigido a emprendedores, si eres un ecommerce o retail podemos ofrecerte beneficios especiales"),
          Pegunta("¿Cómo realizo mis pedidos?"),
          Respuesta(
              "Dirígete a la zona de registro, crea tu cuenta si eres emprendedor o empresa; luego nosotros nos pondremos en contacto."),
          Pegunta("¿Quién paga la entrega?"),
          Respuesta(
              "Qumpa tiene 2 modalidades de pago de acuerdo al servicio, este puede ser contra entrega o al momento de crear el servicio subiendo el comprobante."),
          Pegunta("¿Cómo debe de empaquetar mis entregas?"),
          Respuesta(
              "Es muy importante empaquetar tus productos correctamente; ten en cuenta que el paquete contenga todo lo que tu cliente espera. También es importante que tus paquetes contengan el nombre del destinatario, dirección, teléfono."),
          Pegunta("¿En cuánto tiempo será entregado mi producto a mi cliente?"),
          Respuesta(
              "Una vez que nuestro motorizado retire el producto del lugar de origen, se realiza la entrega inmediatamente; y el tiempo dependerá del servicio contratado (Express y Next Day)."),
          Pegunta("¿Cómo puede rastrear mis entregas?"),
          Respuesta(
              "Es muy sencillo, te diriges al sitio web de la página de QUMPA y te re direccionas en la parte de seguimiento y colocas el DNI de tu cliente."),
          SizedBox(height: alto*0.04,),
          ElevatedButton(

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shadowColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Center(
              child: Text(
                "Regresar",
                style: TextStyle(fontSize: ancho * 0.05, color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/principalEmpresa',
                  arguments: widget.cuentaUsuario);

            },
          ),
          SizedBox(height: alto*0.04,),
        ],
      ),
    );
  }

  TituloPrincipal(String texto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: alto * 0.01),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: ancho * 0.06,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kPrimaryColor, width: 2)),
          color: Colors.white),
    );
  }

  Pegunta(String texto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: alto * 0.02),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: ancho * 0.05,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: const BoxDecoration(
          //border: Border(bottom: BorderSide(color: kPrimaryColor, width: 2)),
          ),
    );
  }

  Respuesta(String texto) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: ancho * 0.02, vertical: alto * 0.01),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: ancho * 0.04,
          color: Colors.black54,
        ),
      ),
      decoration: const BoxDecoration(
        //border: Border(bottom: BorderSide(color: kPrimaryColor, width: 2)),
        color: Color.fromRGBO(0, 0, 0, 0.06),
      ),
    );
  }
}
