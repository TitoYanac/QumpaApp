import 'package:flutter/material.dart';
import 'package:qumpa/constantes.dart';
import 'generador_de_rutas.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qumpa',
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/login',
      //initialRoute: '/principalEmpresa',
      onGenerateRoute: GeneradorDeRutas.generarRuta,
    );
  }
}

