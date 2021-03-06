import 'package:flutter/material.dart';
import 'package:qumpa/Bean/bean_cuenta_usuario.dart';
import '../../../constantes.dart';

class PreguntasFrecuentesConductor extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const PreguntasFrecuentesConductor(this.cuentaUsuario, {Key? key})
      : super(key: key);
  @override
  _PreguntasFrecuentesConductorState createState() =>
      _PreguntasFrecuentesConductorState();
}

class _PreguntasFrecuentesConductorState
    extends State<PreguntasFrecuentesConductor> {
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
            vertical: alto * 0.04, horizontal: ancho * 0.08),
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
                      Navigator.of(context).pushNamed('/principalConductor',
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
              style: TextStyle(
                fontSize: ancho * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: kPrimaryColor,
            margin: EdgeInsets.symmetric(horizontal: ancho * 0.04),
          ),
          Pregunta("??C??mo me registro para hacer entregas con QUMPA?"),
          Respuesta("El registro es completamente online.\nDescarga nuestra app que est?? disponible en Android, luego dir??gete a la zona trabaja con QUMPA; podr??s completar tus datos y documentos que sean requeridos. QUMPA se pondr?? en contacto para poder ya habilitar tu cuenta.\nSi cuentas con una moto debes de tener en cuenta que te solicitaremos licencia de conducir, documento de propiedad, tarjeta de circulaci??n, comprobante de domicilio (recibo de luz o agua), antecedentes penales, documento nacional de identidad (DNI) y datos bancarios."),
          Pregunta("??Requisitos para realizar entregar con QUMPA?"),
          Respuesta(
              "Debes de contar con m??s de 18 a??os, tener un tel??fono Smartphone con acceso a internet y cumplir con la documentaci??n requerida.\nContar con muchas ganas de trabajar, responsable, puntual y muy emp??tico."),
          Pregunta("Mi moto no tiene seguro ??puedo trabajar?"),
          Respuesta(
              "Para poder realizar las entregas, tu moto debe de contar de forma obligatoria con el seguro de SOAT.\nRecuerda tambi??n que al registrarte aceptas nuestros t??rminos y condiciones, donde se indicas que aceptas todas las responsabilidades de forma completa por posibles da??os o accidentes ocurridos durante las entregas, incluyendo veh??culos de terceros."),
          Pregunta("??Qui??n paga la entrega?"),
          Respuesta(
              "Cobramos el valor de las entregas al comercio, no a tu cliente."),
          Pregunta("??Cu??l es la documentaci??n requerida para trabajar en QUMPA?"),
          Respuesta(
              "\t* DNI vigente.\n\t* Licencia de conducir.\n\t* Tarjeta de circulaci??n de la moto.\n\t* Documento de propiedad de la moto.\n\t* Antecedentes penales.\n\t* Recibo de luz o agua (comprobaci??n de la residencia).\n\t* Datos bancarios para transferencia.\n\t* Foto de la moto (visualizaci??n de la placa)."),
          Pregunta("??Qu?? ropa usar para las entregas?"),
          Respuesta(
              "La imagen de QUMPA es muy importante y tu imagen tambi??n.\nEl repartidor debe de contar con la mochila y el logo de la empresa, y a su vez contar con un chaleco que le identifique de la empresa."),
          Pregunta("??Qu?? acciones tomo si me entregan un paquete roto o da??ado?"),
          Respuesta(
              "Recuera que la primera acci??n es indicarle al comercio que no podr?? llevar el paquete mientras no est?? muy bien empaquetado, la segunda es opci??n es reportarlo en nuestra app como se encuentra el paquete y comunicarte con nosotros."),
          Pregunta("??Qu?? hacer si no puedo entregar un paquete?"),
          Respuesta("El cliente es nuestra raz??n de ser, y la misi??n siempre ser?? entregar los productos en el menor tiempo posible.\nSi tienes alg??n inconveniente con la entrega del paquete debes de comunicarte con nosotros en la brevedad posible, de preferencia mediante una llamada telef??nica.\nAv??sanos el tipo de inconveniente o problema que puedas tener."),
          Pregunta("??Que puedo Hacer si olvid?? mi contrase??a"),
          Respuesta("Sabemos muy bien que la contrase??a es muy importante porque as?? podremos tener acceso a nuestra informaci??n.\nDir??gete a la zona de recuperar contrase??a, luego colocas tu correo que registraste, colocar tu nueva contrase??a darle en siguiente; de forma inmediata te llegara a tu correo un c??digo de autenticaci??n (d??gitos) entre n??meros y letras; luego colocar esos d??gitos de autenticaci??n y por ultimo presionar validar.\nAs?? tendr??s acceso nuevamente a la aplicaci??n."),
    Pregunta("??Pueden bloquear mi cuenta con QUMPA?"),
          Respuesta("Cuando tu cuenta se activa recuerda que aceptas todos los t??rminos y condiciones, y por supuesto asumes un compromiso.\nExiste situaciones por las cuales la empresa puede bloquear tu cuenta:\n\n\t* Cancelaci??n de las entregas de forma reiterada\n\t* Reiteradas tardanzas de entregas.\n\t* Hacer entregas con un veh??culo que no est?? registrado en nuestra plataforma.\n\t* Permitir que otras personas realicen las entregas en tu nombre.\n\t* Alterar los paquetes ray??ndolos o modific??ndoles\n\t* Falta de respeto hacia los clientes y el comercio.\n\nRecuerda que los paquetes entregados err??neamente pueden afectar tu imagen, si esto llegara ocurrir debes de comunicarte de forma inmediata con nosotros para solucionarlo de la forma m??s r??pida posible."),
    Pregunta("Si me multan ??la empresa asume el pago?"),
          Respuesta("No. Recuerda que debes de cumplir con todas las leyes de tr??nsito. Recuerda que esas multas est??n bajo tu responsabilidad."),
    Pregunta("??Fecha de pago?"),
          Respuesta("Tras finalizar el mes, los pagos se realizan los (01) primer d??a h??bil de cada mes. Por ello el cierre se realiza el ultimo d??a de cada mes, y es as?? donde vamos a generar tu reporte de pago."),
          SizedBox(height: alto*0.02,),
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
              Navigator.of(context).pushNamed('/principalConductor',
                  arguments: widget.cuentaUsuario);

            },
          ),
        ],
      ),
    );
  }

  TituloPrincipal(String texto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: alto * 0.02),
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

  Pregunta(String texto) {
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
