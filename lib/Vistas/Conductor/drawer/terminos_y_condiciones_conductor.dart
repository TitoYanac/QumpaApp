import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';

import '../../../constantes.dart';

class TerminosYCondicionesConductor extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const TerminosYCondicionesConductor(this.cuentaUsuario, {Key? key})
      : super(key: key);
  @override
  _TerminosYCondicionesConductorState createState() =>
      _TerminosYCondicionesConductorState();
}

class _TerminosYCondicionesConductorState
    extends State<TerminosYCondicionesConductor> {
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
              "Terminos y Condiciones",
              style: TextStyle(fontSize: ancho * 0.05),
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
          Titulo2("I. Introducción."),
          Parrafo(
              "Qumpa es una compañía de plataforma tecnológica, que tiene como principal objetivo la intermediación del servicio de transporte especial Courier; con una conexión con clientes corporativos y clientes no corporativos. La plataforma permite a los negocios registrarse y acceder en línea, viendo toda la información detallada relacionada con los servicios de Qumpa."),
          Parrafo(
              "Qumpa actúa como mero intermediario y, por lo tanto, no puede asumir la responsabilidad sobre la calidad de los productos ofrecidos por los comercios, ni por dicho tercero.\n"),
          Parrafo(
              "Las presentes condiciones generales, regulan los términos y condiciones de acceso y el uso del sitio web de QUMPA; donde los clientes corporativos son los usuarios del portal (en adelante, el “usuario”) deberá leer y aceptar para poder hacer uso de todo los servicios e información que dispone el portal web. El acceso y/o utilización del sitio web de sus contenidos y/o servicios establece y significa que el usuario haber leído, aceptado y comprendido los términos y condiciones que se detallaran a continuación."),
          Titulo2("II. Términos y Condiciones Generales."),
          Titulo3("1. Registro de clientes corporativos"),
          Itemlist(
              "Es obligatorio completar el registro en todos los campos con los datos válidos, para hacer uso de la plataforma.\n"),
          Itemlist(
              "Toda solicitud de servicios se realiza desde la página web de Qumpa https://www.qumpa.com\n"),
          Itemlist(
              "La forma aceptada de pago por nuestro servicio es con débito y/o crédito. No se aceptarán servicio de pago contra entrega, ni efectivo.\n"),
          Itemlist(
              "En el servicio de entrega, el usuario debe de enviar los paquetes debidamente embalados y rotulados; si el paquete no cuenta con estas características no será despachado por no tener los materiales de embalaje adecuado.\n"),
          Itemlist("Aceptar las presentes condiciones de uso.\n"),
          Itemlist(
              "Aceptar la política de privacidad y protección de datos.\n"),
          Itemlist(
              "El usuario es responsable de todas las operaciones efectuadas en su cuenta, porque es uso exclusivo del usuario. El usuario también se compromete a notificar a la compañía Qumpa de forma inmediata, ante cualquier uso no autorizado de su cuenta.\n"),
          Itemlist(
              "El usuario se compromete a usar el servicio sin fines ilícitos.\n"),
          Titulo3("2. Registro de clientes no corporativos"),
          Itemlist(
              "Es obligatorio completar el registro en todos los campos con los datos válidos, para hacer uso de la plataforma.\n"),
          Itemlist(
              "Toda solicitud de servicios se realiza desde la página web de Qumpa https://www.qumpa.com\n"),
          Itemlist(
              "La forma aceptada de pago por nuestro servicio es con débito y/o crédito, y pagos contra entrega.\n"),
          Itemlist(
              "En el servicio de entrega, el usuario debe de enviar los paquetes debidamente embalados y rotulados; si el paquete no cuenta con estas características no será despachado por no tener los materiales de embalaje adecuado.\n"),
          Itemlist("Aceptar las presentes condiciones de uso.\n"),
          Itemlist(
              "Aceptar la política de privacidad y protección de datos.\n"),
          Itemlist(
              "El usuario es responsable de todas las operaciones efectuadas en su cuenta, porque es uso exclusivo del usuario. El usuario también se compromete a notificar a la compañía Qumpa de forma inmediata, ante cualquier uso no autorizado de su cuenta"),
          Titulo2(
              "III Condiciones de los Servicio de Entrega, Programa y Tarifa"),
          Titulo3("Entrega"),
          Itemlist(
              "Valido para entregas a domicilio (Según la dirección de entrega, dada por el usuario).\n"),
          Itemlist(
              "El usuario tiene la opción de cancelar el servicio, antes que el motorizado se encuentre en el punto de origen de recojo.\n"),
          Itemlist(
              "En caso los motorizados no se encuentren disponibles para recoger un pedido, Qumpa cancelara el servicio automáticamente pasado una hora desde que se realizó el pedido.\n"),
          Itemlist(
              "La compañía Qumpa solo brinda el servicio de recepción de mercadería y /o Courier, monitoreando la ruta de entrega; en tal sentido no hace ninguna responsabilidad sobre el contenido de la mercadería.\n"),
          Itemlist(
              "Qumpa no se hace responsable por los envíos no aceptados por los clientes.\n"),
          Itemlist(
              "En cuanto al cliente no se encuentre en el punto de entrega o dirección asignada, el motorizado tiene un plazo de 5 minutos de espera en el punto, o de lo contrario, informando al usuario y se procede a la devolución de origen.\n"),
          Itemlist(
              "En caso el intento de recojo falle por causa que se le atribuye al usuario, Qumpa no cobrara el servicio, pero si una penalidad de S/5 por incumplimiento. Qumpa no reprogramará, el usuario tendrá que generar un nuevo servicio mediante la plataforma web.\n"),
          Itemlist(
              "En caso que el intento de recojo falle por causa de Qumpa, se podrá realizar la programación, previa coordinación con el usuario, sin ningún tipo de costo adicional. El nuevo envió programado se dará en un periodo máximo de 48 horas.\n"),
          Itemlist(
              "El usuario debe especificar en nuestro sitio web, el tipo de documento o producto que se entregara al destinatario.\n"),
          Itemlist(
              "Horarios de entrega: L-V: 8 am – 6 pm S: 9 am – 5 pm Tamaño Small (pequeño) Largo 15cm x Ancho 15cm x Alto 15cm hasta 3 kg. Tamaño mediano Largo 30cm x Ancho 30cm x Alto 30cm hasta 8 kg Tamaño máximo de caja es de Largo 35cm x Ancho 40cm x Alto 40cm hasta 12 kg.\n"),
          Titulo3("Programa"),
          Parrafo("Qumpa cuenta por 3 programas de servicios:\n"),
          Itemlist(
              "Servicio Express: Realizamos envíos en un máximo de 3 horas. En el servicio, el tiempo de envió inicia desde el momento en que se confirma el pedido, en un lapso de (03) horas incluido el recojo y la entrega. En el caso de los envíos multidestino, el tiempo de la ruta es variable dependiendo de la cantidad de puntos y kilómetros de cada punto. Se entiende que el tiempo podría exceder las 3 horas en estos casos.\n"),
          Itemlist(
              "Same Day: Entregas programadas para el mismo día con recojo de almacén o tienda. En el servicio, el tiempo inicia desde el momento en que se recoge el pedido en un rango variable del día de la compra por el cliente. Estas entregas son programadas en mismo día. Elige un punto de recogida y varios puntos de entrega con sus franjas horarias.\n"),
          Itemlist(
              "Next Day: Entregas programadas para el día siguiente con recojo de almacén o tienda.\n"),
          Titulo3("Tarifa"),
          Parrafo(
              "Las tarifas que actualmente maneja la compañía, son tarifas planas. Actualmente se ofrecen 3 tipos tarifas de acuerdo a su servicio:\n"),
          Itemlist(
              "Servicio Express: Se cobrarán S/ 7.00 por los primeros 5 kilómetros, además se cobrará S/1 por kilómetro adicional. Los precios incluyen IGV.\n"),
          Itemlist(
              "Servicio Same Day: El pago regular de este servicio es de S/ 8.00; el pago va variar de acuerda a la zona de reparto.\n"),
          Itemlist(
              "Servicio Next Day: El pago regular de este servicio es de S/ 9.00, una vez programado el envío para el día siguiente de entrega, el pago va variar de acuerda a la zona de reparto.\n"),
          Itemlist(
              "Adicionalmente, Qumpa podrá modificar temporalmente las tarifas de su servicio por razones de campañas, promociones.\n"),
          Titulo2("IV Motorizados QUMPA"),
          Parrafo("Qué tipo de documentos requieres para trabajar en Qumpa"),
          Itemlist("DNI vigente.\n"),
          Itemlist("Licencia de conducir.\n"),
          Itemlist("Tarjeta de circulación de la moto.\n"),
          Itemlist("Documento de propiedad de la moto.\n"),
          Itemlist("Antecedentes penales.\n"),
          Itemlist("Recibo de luz o agua (comprobación de la residencia).\n"),
          Itemlist("Datos bancarios para transferencia.\n"),
          Itemlist("Foto de la moto (visualización de la placa).\n"),
          Parrafo(
              "Para poder realizar las entregas, tu moto debe de contar de forma obligatoria con el seguro de SOAT. Debes de contar con más de 18 años, tener un teléfono Smartphone con acceso a internet y cumplir con la documentación requerida. Como motorizado eres responsable de forma completa por posibles daños o accidentes ocurridos durante las entregas, incluyendo vehículos de terceros. El repartidor debe de contar con la mochila y el logo de la empresa, y a su vez contar con un chaleco que le identifique de la empresa.\n"),
          Titulo2("IV Restricciones del Servicio"),
          Itemlist("El servicio cubre Lima.\n"),
          Itemlist(
              "No se admiten, armas de fuego, partes de animales, material pornográfico que involucre a menores que puede ser percibido como pedofilia.\n"),
          Itemlist(
              "No se admiten, drogas ilegales, narcóticos, que no produzcan beneficios no probados para la salud.\n"),
          Itemlist(
              "No se admiten partes del cuerpo u órganos, y que vayan contra la ley.\n"),
          Titulo2("V Aceptación del Servicio"),
          Itemlist(
              "El usuario aclara debidamente enterado de todas y cada de la disposición en los términos y condiciones, aceptando y procediendo suscribir la presente señal de conformidad y aceptación automática.\n"),
          Titulo2("VI Servicio de Atención al Cliente"),
          Titulo3("Horario de atención:"),
          Itemlist("De lunes a viernes de 9 am a 8 pm Sábado de 9 am a 1 pm\n"),
          Titulo3("Canales de comunicación:"),
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
                Navigator.of(context).pushNamed('/principalConductor',
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
