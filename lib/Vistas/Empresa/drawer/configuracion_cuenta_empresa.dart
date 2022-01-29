import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';

import '../../../constantes.dart';

class ConfiguracionCuentaEmpresa extends StatefulWidget {
  final CuentaUsuario cuentaUsuario;
  const ConfiguracionCuentaEmpresa(this.cuentaUsuario, {Key? key})
      : super(key: key);
  @override
  _ConfiguracionCuentaEmpresaState createState() =>
      _ConfiguracionCuentaEmpresaState();
}

class _ConfiguracionCuentaEmpresaState
    extends State<ConfiguracionCuentaEmpresa> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  bool _passwordVisible3 = false;
  bool _motivo = true;

  TextEditingController passOld = TextEditingController();
  TextEditingController passNew = TextEditingController();
  TextEditingController passEliminar = TextEditingController();
  TextEditingController motivo = TextEditingController();

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

    const String alfabeto =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    String token = "";

    for (int i = 0; i < 7; i++) {
      Random random = new Random();
      int randomNumber = random.nextInt(62);
      token += alfabeto.substring(randomNumber, randomNumber + 1);
    }

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
              "Configuración de la cuenta",
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
          Container(
            margin: EdgeInsets.symmetric(vertical: alto * 0.02),
            child: Text(
              "Cambio de Contraseña",
              style: TextStyle(
                  fontSize: ancho * 0.05,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              "Como recomendación su contraseña de tener caracteres especiales ademas de mayusculas, minusculas y números.",
              style: TextStyle(fontSize: ancho * 0.039, color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ancho * 0.04,
              right: ancho * 0.04,
              top: ancho * 0.04,
              bottom: ancho * 0.04,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: ancho * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.02),
                    child: TextFormField(
                      controller: passOld,
                      obscureText: !_passwordVisible1,
                      style: TextStyle(fontSize: ancho * 0.05),
                      decoration: InputDecoration(
                        hintText: 'Contraseña Actual',
                        hintStyle: TextStyle(fontSize: ancho * 0.05),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ancho * 0.08,
                  height: ancho * 0.08,
                  //color: Colors.red,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                      size: ancho * 0.08,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible1 = !_passwordVisible1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ancho * 0.04,
              right: ancho * 0.04,
              top: ancho * 0.04,
              bottom: ancho * 0.04,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: ancho * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.02),
                    child: TextFormField(
                      controller: passNew,
                      obscureText: !_passwordVisible2,
                      style: TextStyle(fontSize: ancho * 0.05),
                      decoration: InputDecoration(
                        hintText: 'Nueva Contraseña',
                        hintStyle: TextStyle(fontSize: ancho * 0.05),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ancho * 0.08,
                  height: ancho * 0.08,
                  //color: Colors.red,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                      size: ancho * 0.08,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible2 = !_passwordVisible2;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shadowColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Center(
              child: Text(
                "Guardar Cambio",
                style: TextStyle(fontSize: ancho * 0.05, color: Colors.white),
              ),
            ),
            onPressed: () {
              actualizarPassword(context);
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: alto * 0.02),
            child: Text(
              "\nEliminar Cuenta",
              style: TextStyle(
                  fontSize: ancho * 0.05,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              "Su cuenta será eliminada en los proximos 7 dias de inactividad. Siendo imposible volver a recuperar.:",
              style: TextStyle(fontSize: ancho * 0.04, color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ancho * 0.04,
              right: ancho * 0.04,
              top: ancho * 0.04,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: ancho * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.02),
                    child: TextFormField(
                      controller: passEliminar,
                      obscureText: !_passwordVisible3,
                      style: TextStyle(fontSize: ancho * 0.05),
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu Contraseña',
                        hintStyle: TextStyle(fontSize: ancho * 0.05),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ancho * 0.08,
                  height: ancho * 0.08,
                  //color: Colors.red,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible3
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                      size: ancho * 0.08,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible3 = !_passwordVisible3;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ancho * 0.04,
              right: ancho * 0.04,
              top: ancho * 0.04,
            ),
            child: Text(
              "Ingresa el siguiente código para confirmar:\n\n${token}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ancho * 0.04, color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ancho * 0.04,
              right: ancho * 0.04,
              top: ancho * 0.04,
              bottom: ancho * 0.04,
            ),
            child: TextFormField(
              controller: motivo,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              expands: false,
              enableSuggestions: false,
              style: TextStyle(
                fontSize: ancho * 0.04,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: ancho * 0.01),
              ),
            ),
            decoration: BoxDecoration(
              //color: Colors.red,
              border: Border(
                bottom: BorderSide(
                    width: 1, color: _motivo ? kPrimaryColor : Colors.red),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shadowColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Center(
              child: Text(
                "Me voy de Qumpa",
                style: TextStyle(fontSize: ancho * 0.05, color: Colors.white),
              ),
            ),
            onPressed: () {
              if (passEliminar.text.isNotEmpty) {
                if (token.compareTo(motivo.text) == 0) {
                  opcionesSuspenderCuenta(context);
                } else {
                  Error("Codigo Ingresado no coincide", ancho, context);
                }
              } else {
                Error("Ingrese su contraseña", ancho, context);
              }
            },
          ),
        ],
      ),
    );
  }

  actualizarPassword(context) async {
    String url = "$servidor/Empresa/App_Password_Actualizar.php";

    final Map<String, dynamic> activityData = {
      'idUsuario': widget.cuentaUsuario.idCuentaUsuario,
      'actual': passOld.text,
      'nuevo': passNew.text,
    };

    final http.Response response =
        await http.post(Uri.parse(url), body: activityData);

    var jsonData = jsonDecode(response.body);
    print(jsonData['0']);
    if (jsonData['0'] == "1") {
      Error("Actualización Exitosa!!", ancho, context);
    } else {
      Error("No se actualizó la contraseña", ancho, context);
    }
  }

  suspenderCuenta(context) async {
    String url = "$servidor/Empresa/App_Cuenta_Suspender.php";

    final Map<String, dynamic> activityData = {
      'idUsuario': widget.cuentaUsuario.idCuentaUsuario,
      'actual': passEliminar.text,
    };

    final http.Response response =
        await http.post(Uri.parse(url), body: activityData);

    var jsonData = jsonDecode(response.body);
    print(jsonData['0']);
    if (jsonData['0'] == "1") {
      Error("La cuenta ha sido eliminada!!", ancho, context);
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Error("Ocurrio un Error inesperado!\nNo se ha podido suspender la cuenta.", ancho, context);
    }
  }

  opcionesSuspenderCuenta(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: ancho * 0.1),
            child: Image.asset("assets/images/logo_qumpa.png")),
        content: SizedBox(
          height: alto * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Esta acción dejará tu cuenta inactiva.",
                style: TextStyle(fontSize: ancho * 0.05),
              ),
              Text(
                "Deseas continuar?",
                style: TextStyle(fontSize: ancho * 0.05),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          Container(
            color: kPrimaryColor,
            margin: EdgeInsets.only(bottom: alto * 0.02),
            child: TextButton(
              onPressed: () {
                return Navigator.pop(context);
              },
              child: Text(
                "No",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.only(bottom: alto * 0.02),
            child: TextButton(
              onPressed: () {
                suspenderCuenta(context);
              },
              child: Text(
                "Sí",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        elevation: 24,
        backgroundColor: Colors.white,
      ),
    );
  }
}
