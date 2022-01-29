import 'package:flutter/material.dart';

/*
conexion base de datps desarrollo
*/
//const servidor = "http://10.0.2.2/Proyectos/Qumpa/App"; //localhost
/*
conexion base de datos produccion
 */
const servidor = "https://www.qumpa.com/App";


const kPrimaryColor = Color.fromRGBO(246, 164, 36, 1);
const kSecondaryColor = Color.fromRGBO(173, 172, 172, 1);
const kThirdColor = Color.fromRGBO(229, 226, 225, 1);

const String img1 = "assets/images/banner_login.png";
const String img2 = "assets/images/logo_normal.png";

List<Map> tiposDeEnvio = [
  {
    'idtipo': '1',
    'tipo': 'EXPRESS',
    'icon': 'assets/icons/icon_express.png',
    'text':'Realizamos envíos en un máximo de 3 horas.',
        //'Realiza tus envíos el mismo día en horario 1pm a 5pm. Solo a nivel de Lima y Callao',
    //'tiempo': 'Tiempo estimado: 3 horas'
    'tiempo': '(Servicio aplica ciertas restricciones)',
  },
/*
  {
    'idtipo': '2',
    'tipo': 'SAME DAY',
    'icon': 'assets/icons/icon_same_day.png',
    'text':
        'Registra un envío hasta el medio día de hoy y será entregado en horarios de la tarde. Solo a nivel de Lima y Callao',
    'tiempo': 'Hora de entrega entre: 1pm - 8pm'
  },
  */
  {
    'idtipo': '3',
    'tipo': 'NEXT DAY',
    'icon': 'assets/icons/icon_next_day.png',
    'text':'programa tus envíos un día antes & lo entregamos a tus clientes al día siguiente.',
       // 'Registra un envío para mañana y será enviado en el horario de 8am a 1pm. Solo a nivel de Lima y Callao',
    'tiempo': '(Registra tu envió de 7am hasta las 23h)\nPaquete maximo en peso de 8kg',
  },
];
List<String> miDistrito = [
  'CERCADO DE LIMA',
  'BREÑA',
  'RIMAC',
  'PUEBLO LIBRE',
  'SAN MIGUEL',
  'MAGDALENA DEL MAR',
  'LINCE',
  'JESUS MARIA',
  'LA VICTORIA',
  'SAN LUIS',
  'SAN ISIDRO',
  'SAN BORJA',
  'SURQUILLO',
  'MIRAFLORES',
  'BARRANCO',
  'SANTIAGO DE SURCO',
  'CHORRILLOS',
  'SAN JUAN DE MIRAFLORES',
  'LA MOLINA',
  'SAN JUAN DE LURIGANCHO',
  'EL AGUSTINO',
  'SANTA ANITA',
  'INDEPENDENCIA',
  'LOS OLIVOS',
  'SAN MARTIN DE PORRES'
];
List<String> miCategoria = [
  "Calzados",
  "Regalos Personalizados",
  "Decoración",
  "Documentos",
  "Libros",
  "Marketplace",
  "Moda & Accesorios",
  "Oficina",
  "Salud & Belleza",
  "Otros"
];
List<String> miCantEnvios = [
  '0 a 49',
  '50 a 200',
  '201 a 400',
  '401 a más',
];

List<String> miMes = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'
];
class tituloPopUp extends StatelessWidget {
  tituloPopUp(String this.titulo);
  String titulo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "$titulo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class subTituloPopUp extends StatelessWidget {
  subTituloPopUp(String this.subtitulo);
  String subtitulo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "$subtitulo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

class textoNornalPopUp extends StatelessWidget {
  textoNornalPopUp(String this.texto);
  String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
      margin: EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width - 130,
      child: Text(
        "$texto",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: Colors.black45),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kPrimaryColor, width: 1),
          // left: BorderSide(color: kPrimaryColor, width: 2),
        ),
      ),
    );
  }
}

void Error(String text, double ancho, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: ancho * 0.04),
      ),
    ),
  );
}
