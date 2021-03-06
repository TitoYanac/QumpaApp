import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';

import '../../../constantes.dart';

class TerminosYCondicionesEmpresa extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const TerminosYCondicionesEmpresa(this.cuentaUsuario, {Key? key})
      : super(key: key);
  @override
  _TerminosYCondicionesEmpresaState createState() =>
      _TerminosYCondicionesEmpresaState();
}

class _TerminosYCondicionesEmpresaState
    extends State<TerminosYCondicionesEmpresa> {
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
              "Terminos y Condiciones",
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
          Titulo2("I. Introducci??n."),
          Parrafo(
              "Qumpa es una compa????a de plataforma tecnol??gica, que tiene como principal objetivo la intermediaci??n del servicio de transporte especial Courier; con una conexi??n con clientes corporativos y clientes no corporativos. La plataforma permite a los negocios registrarse y acceder en l??nea, viendo toda la informaci??n detallada relacionada con los servicios de Qumpa."),
          Parrafo(
              "Qumpa act??a como mero intermediario y, por lo tanto, no puede asumir la responsabilidad sobre la calidad de los productos ofrecidos por los comercios, ni por dicho tercero.\n"),
          Parrafo(
              "Las presentes condiciones generales, regulan los t??rminos y condiciones de acceso y el uso del sitio web de QUMPA; donde los clientes corporativos son los usuarios del portal (en adelante, el ???usuario???) deber?? leer y aceptar para poder hacer uso de todo los servicios e informaci??n que dispone el portal web. El acceso y/o utilizaci??n del sitio web de sus contenidos y/o servicios establece y significa que el usuario haber le??do, aceptado y comprendido los t??rminos y condiciones que se detallaran a continuaci??n."),
          Titulo2("II. T??rminos y Condiciones Generales."),
          Titulo3("1. Registro de clientes corporativos"),
          Itemlist(
              "Es obligatorio completar el registro en todos los campos con los datos v??lidos, para hacer uso de la plataforma.\n"),
          Itemlist(
              "Toda solicitud de servicios se realiza desde la p??gina web de Qumpa https://www.qumpa.com\n"),
          Itemlist(
              "La forma aceptada de pago por nuestro servicio es con d??bito y/o cr??dito. No se aceptar??n servicio de pago contra entrega, ni efectivo.\n"),
          Itemlist(
              "En el servicio de entrega, el usuario debe de enviar los paquetes debidamente embalados y rotulados; si el paquete no cuenta con estas caracter??sticas no ser?? despachado por no tener los materiales de embalaje adecuado.\n"),
          Itemlist("Aceptar las presentes condiciones de uso.\n"),
          Itemlist(
              "Aceptar la pol??tica de privacidad y protecci??n de datos.\n"),
          Itemlist(
              "El usuario es responsable de todas las operaciones efectuadas en su cuenta, porque es uso exclusivo del usuario. El usuario tambi??n se compromete a notificar a la compa????a Qumpa de forma inmediata, ante cualquier uso no autorizado de su cuenta.\n"),
          Itemlist(
              "El usuario se compromete a usar el servicio sin fines il??citos.\n"),
          Titulo3("2. Registro de clientes no corporativos"),
          Itemlist(
              "Es obligatorio completar el registro en todos los campos con los datos v??lidos, para hacer uso de la plataforma.\n"),
          Itemlist(
              "Toda solicitud de servicios se realiza desde la p??gina web de Qumpa https://www.qumpa.com\n"),
          Itemlist(
              "La forma aceptada de pago por nuestro servicio es con d??bito y/o cr??dito, y pagos contra entrega.\n"),
          Itemlist(
              "En el servicio de entrega, el usuario debe de enviar los paquetes debidamente embalados y rotulados; si el paquete no cuenta con estas caracter??sticas no ser?? despachado por no tener los materiales de embalaje adecuado.\n"),
          Itemlist("Aceptar las presentes condiciones de uso.\n"),
          Itemlist(
              "Aceptar la pol??tica de privacidad y protecci??n de datos.\n"),
          Itemlist(
              "El usuario es responsable de todas las operaciones efectuadas en su cuenta, porque es uso exclusivo del usuario. El usuario tambi??n se compromete a notificar a la compa????a Qumpa de forma inmediata, ante cualquier uso no autorizado de su cuenta"),
          Titulo2(
              "III Condiciones de los Servicio de Entrega, Programa y Tarifa"),
          Titulo3("Entrega"),
          Itemlist(
              "Valido para entregas a domicilio (Seg??n la direcci??n de entrega, dada por el usuario).\n"),
          Itemlist(
              "El usuario tiene la opci??n de cancelar el servicio, antes que el motorizado se encuentre en el punto de origen de recojo.\n"),
          Itemlist(
              "En caso los motorizados no se encuentren disponibles para recoger un pedido, Qumpa cancelara el servicio autom??ticamente pasado una hora desde que se realiz?? el pedido.\n"),
          Itemlist(
              "La compa????a Qumpa solo brinda el servicio de recepci??n de mercader??a y /o Courier, monitoreando la ruta de entrega; en tal sentido no hace ninguna responsabilidad sobre el contenido de la mercader??a.\n"),
          Itemlist(
              "Qumpa no se hace responsable por los env??os no aceptados por los clientes.\n"),
          Itemlist(
              "En cuanto al cliente no se encuentre en el punto de entrega o direcci??n asignada, el motorizado tiene un plazo de 5 minutos de espera en el punto, o de lo contrario, informando al usuario y se procede a la devoluci??n de origen.\n"),
          Itemlist(
              "En caso el intento de recojo falle por causa que se le atribuye al usuario, Qumpa no cobrara el servicio, pero si una penalidad de S/5 por incumplimiento. Qumpa no reprogramar??, el usuario tendr?? que generar un nuevo servicio mediante la plataforma web.\n"),
          Itemlist(
              "En caso que el intento de recojo falle por causa de Qumpa, se podr?? realizar la programaci??n, previa coordinaci??n con el usuario, sin ning??n tipo de costo adicional. El nuevo envi?? programado se dar?? en un periodo m??ximo de 48 horas.\n"),
          Itemlist(
              "El usuario debe especificar en nuestro sitio web, el tipo de documento o producto que se entregara al destinatario.\n"),
          Itemlist(
              "Horarios de entrega: L-V: 8 am ??? 6 pm S: 9 am ??? 5 pm Tama??o Small (peque??o) Largo 15cm x Ancho 15cm x Alto 15cm hasta 3 kg. Tama??o mediano Largo 30cm x Ancho 30cm x Alto 30cm hasta 8 kg Tama??o m??ximo de caja es de Largo 35cm x Ancho 40cm x Alto 40cm hasta 12 kg.\n"),
          Titulo3("Programa"),
          Parrafo("Qumpa cuenta por 3 programas de servicios:\n"),
          Itemlist(
              "Servicio Express: Realizamos env??os en un m??ximo de 3 horas. En el servicio, el tiempo de envi?? inicia desde el momento en que se confirma el pedido, en un lapso de (03) horas incluido el recojo y la entrega. En el caso de los env??os multidestino, el tiempo de la ruta es variable dependiendo de la cantidad de puntos y kil??metros de cada punto. Se entiende que el tiempo podr??a exceder las 3 horas en estos casos.\n"),
          Itemlist(
              "Same Day: Entregas programadas para el mismo d??a con recojo de almac??n o tienda. En el servicio, el tiempo inicia desde el momento en que se recoge el pedido en un rango variable del d??a de la compra por el cliente. Estas entregas son programadas en mismo d??a. Elige un punto de recogida y varios puntos de entrega con sus franjas horarias.\n"),
          Itemlist(
              "Next Day: Entregas programadas para el d??a siguiente con recojo de almac??n o tienda.\n"),
          Titulo3("Tarifa"),
          Parrafo(
              "Las tarifas que actualmente maneja la compa????a, son tarifas planas. Actualmente se ofrecen 3 tipos tarifas de acuerdo a su servicio:\n"),
          Itemlist(
              "Servicio Express: Se cobrar??n S/ 7.00 por los primeros 5 kil??metros, adem??s se cobrar?? S/1 por kil??metro adicional. Los precios incluyen IGV.\n"),
          Itemlist(
              "Servicio Same Day: El pago regular de este servicio es de S/ 8.00; el pago va variar de acuerda a la zona de reparto.\n"),
          Itemlist(
              "Servicio Next Day: El pago regular de este servicio es de S/ 9.00, una vez programado el env??o para el d??a siguiente de entrega, el pago va variar de acuerda a la zona de reparto.\n"),
          Itemlist(
              "Adicionalmente, Qumpa podr?? modificar temporalmente las tarifas de su servicio por razones de campa??as, promociones.\n"),
          Titulo2("IV Motorizados QUMPA"),
          Parrafo("Qu?? tipo de documentos requieres para trabajar en Qumpa"),
          Itemlist("DNI vigente.\n"),
          Itemlist("Licencia de conducir.\n"),
          Itemlist("Tarjeta de circulaci??n de la moto.\n"),
          Itemlist("Documento de propiedad de la moto.\n"),
          Itemlist("Antecedentes penales.\n"),
          Itemlist("Recibo de luz o agua (comprobaci??n de la residencia).\n"),
          Itemlist("Datos bancarios para transferencia.\n"),
          Itemlist("Foto de la moto (visualizaci??n de la placa).\n"),
          Parrafo(
              "Para poder realizar las entregas, tu moto debe de contar de forma obligatoria con el seguro de SOAT. Debes de contar con m??s de 18 a??os, tener un tel??fono Smartphone con acceso a internet y cumplir con la documentaci??n requerida. Como motorizado eres responsable de forma completa por posibles da??os o accidentes ocurridos durante las entregas, incluyendo veh??culos de terceros. El repartidor debe de contar con la mochila y el logo de la empresa, y a su vez contar con un chaleco que le identifique de la empresa.\n"),
          Titulo2("IV Restricciones del Servicio"),
          Itemlist("El servicio cubre Lima.\n"),
          Itemlist(
              "No se admiten, armas de fuego, partes de animales, material pornogr??fico que involucre a menores que puede ser percibido como pedofilia.\n"),
          Itemlist(
              "No se admiten, drogas ilegales, narc??ticos, que no produzcan beneficios no probados para la salud.\n"),
          Itemlist(
              "No se admiten partes del cuerpo u ??rganos, y que vayan contra la ley.\n"),
          Titulo2("V Aceptaci??n del Servicio"),
          Itemlist(
              "El usuario aclara debidamente enterado de todas y cada de la disposici??n en los t??rminos y condiciones, aceptando y procediendo suscribir la presente se??al de conformidad y aceptaci??n autom??tica.\n"),
          Titulo2("VI Servicio de Atenci??n al Cliente"),
          Titulo3("Horario de atenci??n:"),
          Itemlist("De lunes a viernes de 9 am a 8 pm S??bado de 9 am a 1 pm\n"),
          Titulo3("Canales de comunicaci??n:"),
          Itemlist("contacto@qumpa.com\n"),
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
        ],
      ),
    );
  }

  Titulo2(String title2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: alto * 0.01),
      child: Text(
        "$title2",
        style: TextStyle(
            fontSize: ancho * 0.056,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }

  Titulo3(String title2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: alto * 0.01),
      child: Text(
        "$title2",
        style: TextStyle(
            fontSize: ancho * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
      ),
    );
  }

  Parrafo(String title2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
      child: Text(
        "$title2",
        style: TextStyle(fontSize: ancho * 0.04, color: Colors.black54),
      ),
    );
  }

  Itemlist(String title2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
      child: Text(
        "* $title2",
        style: TextStyle(fontSize: ancho * 0.04, color: Colors.black54),
      ),
    );
  }
}
