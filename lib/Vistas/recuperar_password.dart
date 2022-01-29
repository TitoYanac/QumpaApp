import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../constantes.dart';

class RecuperarPassword extends StatefulWidget {
  const RecuperarPassword({Key? key}) : super(key: key);
  @override
  _RecuperarPasswordState createState() => _RecuperarPasswordState();
}

class _RecuperarPasswordState extends State<RecuperarPassword> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  TextEditingController correo = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        toolbarHeight: alto * 0.13,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              "assets/icons/icon_close.png",
              fit: BoxFit.fitHeight,
              color: Colors.white,
              width: ancho * 0.10,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ),
        titleSpacing: 0,
        title: Center(
          //padding: const EdgeInsets.only(top: 10, left: 10),
          child: Image.asset(
            "assets/images/logo_blanco.png",
            width: ancho * 0.4,
          ),
        ),
        actions: <Widget>[
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashRadius: 01,
            icon: Image.asset(
              "assets/icons/icon_close.png",
              fit: BoxFit.fitHeight,
              color: Colors.transparent,
              width: ancho * 0.12,
            ),
            onPressed: () {
              //Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ancho * 0.1, vertical: alto * 0.02),
            child: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: kPrimaryColor,
                  size: ancho * 0.15,
                ),
                Expanded(
                    child: Text(
                  "Importante!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: ancho * 0.07),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ancho * 0.1, vertical: alto * 0.02),
            child: Text(
              "Las contraseñas no se pueden recuperar, tenga mucho cuidado con sus datos",
              style: TextStyle(fontSize: ancho * 0.05, color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ancho * 0.1, vertical: alto * 0.02),
            child: Text(
              "Ingrese su correo a continuación, ahi le enviaremos un enlace de validación para que pueda modificar su contraseña.",
              style: TextStyle(fontSize: ancho * 0.05, color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ancho * 0.1, vertical: alto * 0.02),
            child: TextFormField(
              controller: correo,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: ancho * 0.05),
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle: TextStyle(fontSize: ancho * 0.05),
                border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 1,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: ancho*0.1,vertical: alto*0.02),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shadowColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(alto*0.01)),
              ),
              child: Center(
                child: Text(
                  "Enviar Link",
                  style:
                  TextStyle(fontSize: ancho * 0.05, color: Colors.white),
                ),
              ),
              onPressed: () {
                enviarCorreoRecuperarPass(context);
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ),
        ],
      ),
    );
  }

  enviarCorreoRecuperarPass(BuildContext context) async {
    String url = "$servidor/recuperar_password.php";

    final Map<String, dynamic> activityData = {
      'email': correo.text,
      'update': 'add',
    };

    var response =
        await http.post(Uri.parse(url), body: activityData);

    print("response: $response");
    print("response.body: ${response.body}");

    var jsonData = jsonDecode(response.body);

    print(jsonData['0']);
    if (jsonData['0'] == "1") {
      Error("Se le envió un correo con las indicaciónes!!", ancho, context);

    } else {
      Error("Ocurrio un error inesperado.", ancho, context);
    }
  }
}
