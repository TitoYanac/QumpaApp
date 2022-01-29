import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';
import '../../../constantes.dart';
class PerfilConductor extends StatefulWidget {
  final CuentaUsuario usuarioConductor;
  const PerfilConductor(this.usuarioConductor, {Key? key}) : super(key: key);
  @override
  _PerfilConductorState createState() => _PerfilConductorState();
}

class _PerfilConductorState extends State<PerfilConductor> {

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
      padding:  EdgeInsets.symmetric( horizontal: ancho * 0.06),
      child: ListView(
        children: <Widget>[

          SizedBox(
            height: alto * 0.02,
          ),
          Text(
            "Datos Personales:",
            style: TextStyle(
              fontSize: ancho * 0.06,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Nombre Completo:","${ widget.usuarioConductor.persona.nombre} ${ widget.usuarioConductor.persona.apellido}"),
          SizedBox(height: alto * 0.02),
          rowTextPerfil("Documento de Identidad (DNI):", widget.usuarioConductor.persona.dni),
          SizedBox(height: alto * 0.02),
          rowTextPerfil("E-mail:", widget.usuarioConductor.correo),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Celular:", widget.usuarioConductor.persona.celular),

          SizedBox(
            height: alto * 0.02,
          ),
          Text(
            "Datos de Conductor:",
            style: TextStyle(
              fontSize: ancho * 0.06,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),

          rowTextPerfil("Numero de Licencia:", widget.usuarioConductor.vehiculo.chofer.numLicencia),
          SizedBox(
            height: alto * 0.02,
          ),

          rowTextPerfil("Fecha de vencimiento de la Licencia:", widget.usuarioConductor.vehiculo.chofer.fecExpedicionLic),
          SizedBox(
            height: alto * 0.02,
          ),


          rowTextPerfil("Imagen Póliza:", widget.usuarioConductor.vehiculo.chofer.imagenPoliza),
          SizedBox(
            height: alto * 0.02,
          ),


          rowTextPerfil("Fecha de Vencimiento del SOAT:", widget.usuarioConductor.vehiculo.chofer.fecVencSoat),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("TUC:", widget.usuarioConductor.vehiculo.chofer.tuc),
          SizedBox(
            height: alto * 0.02,
          ),

          rowTextPerfil("Imagen TUC:", widget.usuarioConductor.vehiculo.chofer.imagenTuc),
          SizedBox(
            height: alto * 0.02,
          ),
          Text(
            "Datos del Vehículo:",
            style: TextStyle(
              fontSize: ancho * 0.06,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),

          rowTextPerfil("Marca:", widget.usuarioConductor.vehiculo.marca),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Modelo:", widget.usuarioConductor.vehiculo.modelo),
          SizedBox(
            height: alto * 0.02,
          ),


          rowTextPerfil("Estado:", widget.usuarioConductor.vehiculo.estadoVehiculo),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Numero de Placa:", widget.usuarioConductor.vehiculo.numPlaca),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Placa Anterior:", widget.usuarioConductor.vehiculo.placaAnterior),
          SizedBox(
            height: alto * 0.02,
          ),

          rowTextPerfil("Color:", widget.usuarioConductor.vehiculo.colorVehiculo),
          SizedBox(
            height: alto * 0.02,
          ),
          rowTextPerfil("Algún dato adicional sobre el Vehiculo:", widget.usuarioConductor.vehiculo.anotaciones),

          SizedBox(
            height: alto * 0.06,
          ),
          Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_rounded,size: ancho*0.12,color: kPrimaryColor,),
                    SizedBox(width: ancho*0.04,),
                    Expanded(child: Text("Importante!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ancho*0.07),))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: alto*0.02,bottom: alto*0.06),child: Text("Para modificar sus datos, póngase en contacto con Qumpa a través de nuestras redes sociales o la pagina web.",style: TextStyle(fontSize: ancho*0.05,color: Colors.black54),)),



              ],
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
                    bottom: BorderSide(
                        width: 1,
                        color: kPrimaryColor ),),
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
