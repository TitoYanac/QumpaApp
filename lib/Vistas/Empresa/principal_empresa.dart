import 'dart:io';

//import 'dart:html';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Bean/bean_cuenta_usuario.dart';
import '../../constantes.dart';
import 'Historial/historial_empresa.dart';
import 'envios/envios_empresa.dart';
import 'Perfil/perfil_empresa.dart';

class PrincipalEmpresa extends StatefulWidget {
  final CuentaUsuario usuarioEmpresa;
  const PrincipalEmpresa(this.usuarioEmpresa, {Key? key}) : super(key: key);
  @override
  _PrincipalEmpresaState createState() => _PrincipalEmpresaState();
}

class _PrincipalEmpresaState extends State<PrincipalEmpresa> {
  bool err = false;
  String msgErr = '';

  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  int _currentindex = 0;
  late final views = [
    EnviosEmpresa(widget.usuarioEmpresa),
    HistorialEmpresa(widget.usuarioEmpresa),
    //PagosEmpresa(widget.usuarioEmpresa),
    PerfilEmpresa(widget.usuarioEmpresa),
  ];
  @override
  void initState() {
    super.initState();
  }

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        toolbarHeight: alto * 0.13,
        leading: Builder(
          builder: (context) => IconButton(
            //padding: const EdgeInsets.only(left: 10, top: 10),
            icon: Image.asset(
              "assets/icons/icon_menu.png",
              fit: BoxFit.fitHeight,
              width: ancho * 0.11,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
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
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: alto * 0.4,
                  width: ancho * 0.8,
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        // height: alto * 0.3,
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: const Center(
                          child: Icon(
                            Icons.business,
                            color: kPrimaryColor,
                            size: 100,
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: kPrimaryColor, width: 2.0)),
                      ),
                      Positioned(
                        right: 0,
                        top: alto * 0.05,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            border: Border.all(
                              width: 1,
                              color: kPrimaryColor,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              return Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: ancho * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: alto * 0.05,
                  padding: EdgeInsets.only(left: ancho * 0.13),
                  child: GestureDetector(
                    child: Text(
                      "Preguntas frecuentes",
                      style: TextStyle(fontSize: ancho * 0.04),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/preguntasFrecuentesEmpresa',
                          arguments: widget.usuarioEmpresa);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: alto * 0.05,
                  padding: EdgeInsets.only(left: ancho * 0.13),
                  child: GestureDetector(
                    child: Text(
                      "Términos y condiciones",
                      style: TextStyle(fontSize: ancho * 0.04),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/terminosYCondicionesEmpresa',
                          arguments: widget.usuarioEmpresa);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: alto * 0.05,
                  padding: EdgeInsets.only(left: ancho * 0.13),
                  child: GestureDetector(
                    child: Text(
                      "Configuración de la cuenta",
                      style: TextStyle(fontSize: ancho * 0.04),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/cambiarPasswordEmpresa',
                          arguments: widget.usuarioEmpresa);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: alto * 0.05,
                  padding: EdgeInsets.only(top: alto*0.02,left: ancho * 0.13),
                  child: GestureDetector(
                    child: Text(
                      "Cerrar Sesión",
                      style:
                      TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: ancho * 0.04),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(left: ancho * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ancho * 0.04,
                          vertical: alto * 0.01,
                        ),
                        child: const FaIcon(FontAwesomeIcons.whatsapp),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: alto*0.04,
                            child: TextButton(
                              onPressed: () {
                                whatsAppOpen(955351749);
                              },
                              child: Text(
                                "+51 955351749",
                                style: TextStyle(fontSize: ancho * 0.04),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: alto*0.04,
                            child: TextButton(
                              onPressed: () {
                                whatsAppOpen(969135017);
                              },
                              child: Text(
                                "+51 969135017",
                                style: TextStyle(fontSize: ancho * 0.04),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ancho * 0.04, vertical: alto * 0.01),
                        child: const FaIcon(FontAwesomeIcons.facebook),
                      ),
                      InkWell(
                        onTap: (){
                      _launchURL('https://facebook.com/qumpaoficial');
                      },
                        child: Text(
                          "facebook.com/qumpaoficial",
                          style: TextStyle(fontSize: ancho * 0.04),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ancho * 0.04, vertical: alto * 0.01),
                        child: const FaIcon(FontAwesomeIcons.instagram),
                      ),
                      InkWell(
                        onTap: (){
                          _launchURL('https://instagram.com/qumpaoficial');
                        },
                        child: Text(
                          "instagram.com/qumpaoficial",
                          style: TextStyle(fontSize: ancho * 0.04),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: alto * 0.04,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: views[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: kPrimaryColor,
        showUnselectedLabels: false,
        currentIndex: _currentindex,
        selectedFontSize: ancho * 0.04,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/icon_menu1.png",
              height: _currentindex == 0 ? ancho * 0.15 : ancho * 0.12,
            ),
            label: "Envios",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/icon_menu2.png",
              height: _currentindex == 1 ? ancho * 0.15 : ancho * 0.12,
            ),
            label: "Pendientes",
            backgroundColor: kPrimaryColor,
          ),
/*
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/icon_menu3.png",
              height: _currentindex == 2 ? ancho * 0.15 : ancho * 0.12,
            ),
            label: "Pagos",
            backgroundColor: kPrimaryColor,
          ),
*/
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/icon_menu4.png",
              height: _currentindex == 2 ? ancho * 0.15 : ancho * 0.12,
            ),
            label: "Perfil",
            backgroundColor: kPrimaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }

  void whatsAppOpen(numero) async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "+51$numero", message: "Hola, tengo una consulta.");
    } else {
      Error("Error. Whatsapp no instalado.", ancho, context);
    }
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) Error('No se pudo conectar a $_url', ancho, context) ;
  }
}
