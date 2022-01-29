import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qumpa/Bean/bean_vehiculo.dart';

import 'Bean/bean_persona.dart';
import 'Bean/bean_ubicacion.dart';
import 'Bean/bean_conductor.dart';
import 'Bean/bean_empresa.dart';
import 'Bean/bean_cuenta_usuario.dart';
import 'constantes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;
  final _loginForm = GlobalKey<FormState>();
  bool _passwordVisible = true;
  TextEditingController pass = TextEditingController();
  TextEditingController correo = TextEditingController();

  late CuentaUsuario datosCuentaUsuario;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _passwordVisible = false;
  }

  Future login(String user, String pass, context, double ancho) async {
    //String url = "$servidor/login.php";
    String url = "$servidor/login.php";
    final response = await http.post(Uri.parse(url), body: {
      "usuario": user,
      "pass": pass,
    });
print("response.statusCode: ${response.statusCode}");
print("response.bodyBytes: ${response.bodyBytes}");
print("response.body: ${response.body}");
    var data = jsonDecode(response.body);
print("data: ${data}");

    if (response.body == "null") {
      Error(
          'El usuario no ha sido entrevistado aún!\nSe enviará a su e-mail las indicaciones.',
          ancho,
          context);
    } else {
      switch (response.statusCode) {
        case 200:
          String body = utf8.decode(response.bodyBytes);
          try {
            final jsonData = jsonDecode(body);
            print("jsonData : $jsonData");
            if (jsonData['status'] == "1") {
              switch (jsonData['tipo']) {
                case '0':
                  String idUbicacionEmpresa = "null";
                  String direccionEmpresa = jsonData['direccion'] ?? "null";
                  String idDistritoEmpresa = (miDistrito.indexOf("${jsonData['distrito']}")+1).toString();
                  String coordenadasEmpresa = "null";
                  String referenciaEmpresa = "null";
                  Ubicacion ubicacionEmpresa = Ubicacion(
                      idUbicacionEmpresa,
                      direccionEmpresa,
                      idDistritoEmpresa,
                      coordenadasEmpresa,
                      referenciaEmpresa);

                  String idCuentaEmpresa =

                      jsonData['idCuentaEmpresa'] ?? "null";
                  String nombreComercial =
                      jsonData['nombreComercial'] ?? "null";
                  String ruc = jsonData['ruc'] ?? "null";
                  String idCategoria = jsonData['idCategoria'] ?? "null";
                  String numEnviosMensuales =
                      jsonData['numEnviosMensuales'] ?? "null";
                  String descripcion = jsonData['descripcion'] ?? "null";
                  Empresa datosEmpresa = Empresa(
                      idCuentaEmpresa,
                      nombreComercial,
                      ruc,
                      idCategoria,
                      numEnviosMensuales,
                      descripcion,
                      ubicacionEmpresa);

                  String idUbicacionPersona = "null";
                  String direccionPersona = "null";
                  String idDistritoPersona = "null";
                  String coordenadasPersona = "null";
                  String referenciaPersona = "null";
                  Ubicacion domicilioPersona = Ubicacion(
                      idUbicacionPersona,
                      direccionPersona,
                      idDistritoPersona,
                      coordenadasPersona,
                      referenciaPersona);

                  String idPersona = "null";
                  String nombre = jsonData['nombreContacto'] ?? "null";
                  String apellido = jsonData['apellidoContacto'] ?? "null";
                  String dni = jsonData['dni'] ?? "null";
                  String celular = jsonData['celular'] ?? "null";
                  Persona datosPersona = Persona(idPersona, nombre, apellido,
                      dni, celular, domicilioPersona);

                  String idCuentaUsuario =
                      jsonData['idCuentaEmpresa'] ?? "null";
                  String correoUsuario = jsonData['correoUsuario'] ?? "null";
                  String passUsuario = jsonData['passUsuario'] ?? "null";
                  String tipoCuenta = jsonData['tipo'] ?? "null";
                  String estadoCuenta = jsonData['status'] ?? "null";
                  String terminosYcondiciones =
                      jsonData['terminosYcondiciones'] ?? "null";

                  Conductor chofer = Conductor(
                    "null",
                    "null",
                    "null",
                    "null",
                    "null",
                    "null",
                    "null",
                    datosPersona,
                  );
                  Vehiculo vehiculo = Vehiculo("null", "null", "null", "null",
                      "null", "null", "null", "null", "null", chofer);
                  datosCuentaUsuario = CuentaUsuario(
                      idCuentaUsuario,
                      correoUsuario,
                      passUsuario,
                      tipoCuenta,
                      estadoCuenta,
                      terminosYcondiciones,
                      datosEmpresa,
                      datosPersona,
                      vehiculo);

                  Navigator.of(context).pushReplacementNamed(
                      '/principalEmpresa',
                      arguments: datosCuentaUsuario);

                  break;
                case '1':
                  String idUbicacionEmpresa = "null";
                  String direccionEmpresa = "null";
                  String idDistritoEmpresa = "null";
                  String coordenadasEmpresa = "null";
                  String referenciaEmpresa = "null";
                  Ubicacion ubicacionEmpresa = Ubicacion(
                      idUbicacionEmpresa,
                      direccionEmpresa,
                      idDistritoEmpresa,
                      coordenadasEmpresa,
                      referenciaEmpresa);

                  String idCuentaEmpresa = "null";
                  String nombreComercial = "Qumpa";
                  String ruc = "null";
                  String idCategoria = "null";
                  String numEnviosMensuales = "null";
                  String descripcion = "Qumpa Testing";
                  Empresa datosEmpresa = Empresa(
                      idCuentaEmpresa,
                      nombreComercial,
                      ruc,
                      idCategoria,
                      numEnviosMensuales,
                      descripcion,
                      ubicacionEmpresa);

                  String idUbicacionPersona = "null";
                  String direccionPersona = "null";
                  String idDistritoPersona = "null";
                  String coordenadasPersona = "null";
                  String referenciaPersona = "null";
                  Ubicacion domicilioPersona = Ubicacion(
                      idUbicacionPersona,
                      direccionPersona,
                      idDistritoPersona,
                      coordenadasPersona,
                      referenciaPersona);

                  String idPersona = jsonData['idCuentaPersona'] ?? "null";
                  String nombre = jsonData['nombre'] ?? "null";
                  String apellido = jsonData['apellido'] ?? "null";
                  String dni = jsonData['documento'] ?? "null";
                  String celular = jsonData['celular'] ?? "null";
                  Persona datosPersona = Persona(idPersona, nombre, apellido,
                      dni, celular, domicilioPersona);

                  String idChofer = jsonData['idChofer'] ?? "null";
                  String tuc = jsonData['tuc'] ?? "null";
                  String numLicencia = jsonData['numLicencia'] ?? "null";
                  String fecExpedicionLic =
                      jsonData['fecExpedicionLic'] ?? "null";
                  String imagenPoliza = jsonData['imagenPoliza'] ?? "null";
                  String fecVencSoat = jsonData['fecVencSoat'] ?? "null";
                  String imagenTuc = jsonData['imagenTuc'] ?? "null";
                  Conductor chofer = Conductor(
                    idChofer,
                    tuc,
                    numLicencia,
                    fecExpedicionLic,
                    imagenPoliza,
                    fecVencSoat,
                    imagenTuc,
                    datosPersona,
                  );

                  String idVehiculo = jsonData['idVehiculo'] ?? "null";
                  String numPlaca = jsonData['numPlaca'] ?? "null";
                  String colorVehiculo = jsonData['colorVehiculo'] ?? "null";
                  String anotaciones = jsonData['anotaciones'] ?? "null";
                  String placaVigente = jsonData['placaVigente'] ?? "null";
                  String placaAnterior = jsonData['placaAnterior'] ?? "null";
                  String marca = jsonData['marca'] ?? "null";
                  String modelo = jsonData['modelo'] ?? "null";
                  String estadoVehiculo = jsonData['estadoVehiculo'] ?? "null";
                  Vehiculo vehiculo = Vehiculo(
                      idVehiculo,
                      numPlaca,
                      colorVehiculo,
                      anotaciones,
                      placaVigente,
                      placaAnterior,
                      marca,
                      modelo,
                      estadoVehiculo,
                      chofer);


                  String idCuentaUsuario =
                      jsonData['idCuentaPersona'] ?? "null";
                  String correoUsuario = jsonData['correoUsuario'] ?? "null";
                  String passUsuario = jsonData['passUsuario'] ?? "null";
                  String tipoCuenta = jsonData['tipo'] ?? "null";
                  String estadoCuenta = jsonData['status'] ?? "null";
                  String terminosYcondiciones =
                      jsonData['terminosYcondiciones'] ?? "null";
                  datosCuentaUsuario = CuentaUsuario(
                      idCuentaUsuario,
                      correoUsuario,
                      passUsuario,
                      tipoCuenta,
                      estadoCuenta,
                      terminosYcondiciones,
                      datosEmpresa,
                      datosPersona,
                      vehiculo);

                  Navigator.of(context).pushReplacementNamed(
                      '/principalConductor',
                      arguments: datosCuentaUsuario);

                  break;
              }
            } else if (jsonData['tipo'] == "0") {
              Error(
                  'La cuenta no Ha sido Activada.\nConsulte con Qumpa a través de nuestras redes sociales.',
                  ancho,
                  context);
            } else {
              Error('Usuario Incorrecto', ancho, context);
            }
          } catch (error) {
            Error(
                'Ocurrio Algo Inesperado!\nEspere unos minutos e intente de nuevo.',
                ancho,
                context);
            throw Exception(error);
          }
          break;
        case 404:
          Error(
              'Aplicación en Mantenimiento\nEspere unos minutos y vuelva a intentar.',
              ancho,
              context);
          break;
      }
    }



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
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: ancho,
            height: alto,
            child: Center(
              child: Form(
                key: _loginForm,
                child: Column(
                  children: [
                    SizedBox(
                      width: ancho,
                      height: ancho * relacionBanner,
                      child: Stack(
                        //overflow: Overflow.clip,
                        clipBehavior: Clip.none,
                        children: [
                          //Image.asset("assets/images/banner_login.png",width:aux),
                          Positioned(
                            left: (ancho - aux) / 2,
                            child: Image.asset(
                              "assets/images/banner_login.png",
                              width: aux,
                            ),
                          )
                        ],
                      ),

                      //color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ancho * 0.12,
                        bottom: ancho * 0.13,
                      ),
                      width: ancho,
                      //height: ancho * relacionLogo,
                      color: Colors.white,
                      child: Center(
                          child: Image.asset("assets/images/logo_qumpa.png",
                              width: ancho / 2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: ancho * 0.08,
                          right: ancho * 0.08,
                          bottom: ancho * 0.09),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ancho * 0.08,
                            height: ancho * 0.08,
                            child: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                              size: ancho * 0.08,
                            ),
                          ),
                          Container(
                            width: ancho * 0.68,
                            //height: ancho * 0.12,
                            padding:
                                EdgeInsets.symmetric(horizontal: ancho * 0.02),
                            child: TextFormField(
                              controller: correo,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: ancho * 0.05),
                              decoration: InputDecoration(
                                hintText: "E-mail",
                                hintStyle: TextStyle(fontSize: ancho * 0.05),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: ancho * 0.01,
                                    vertical: alto * 0.005),
                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            width: ancho * 0.08,
                            height: ancho * 0.08,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ancho * 0.08,
                        right: ancho * 0.08,
                        bottom: ancho * 0.05,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ancho * 0.08,
                            height: ancho * 0.08,
                            child: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                              size: ancho * 0.08,
                            ),
                          ),
                          Container(
                            width: ancho * 0.68,
                            height: ancho * 0.08,
                            padding:
                                EdgeInsets.symmetric(horizontal: ancho * 0.02),
                            child: TextFormField(
                              controller: pass,
                              obscureText: !_passwordVisible,
                              style: TextStyle(fontSize: ancho * 0.05),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(fontSize: ancho * 0.05),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: ancho * 0.01,
                                    vertical: alto * 0.005),
                                isDense: true,
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
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kPrimaryColor,
                                size: ancho * 0.08,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ancho * 0.08,
                        right: ancho * 0.08,
                        bottom: ancho * 0.09,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: ancho * 0.08,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Olvidaste tu contraseña?",
                                style: TextStyle(
                                  fontSize: ancho * 0.035,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/recuperarPassword');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: ancho * 0.08,
                          right: ancho * 0.08,
                          bottom: ancho * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: kPrimaryColor,
                                ),
                              ),
                              height: ancho * 0.1,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shadowColor:
                                      MaterialStateProperty.all(kPrimaryColor),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: ancho * 0.05,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(correo.text);
                                  bool passValid = !pass.text.contains(" ");

                                  if (emailValid && passValid) {
                                    login(
                                        correo.text, pass.text, context, ancho);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: kPrimaryColor,
                                        content: Text(
                                          'Usuario Incorrecto',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ancho * 0.04),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: kPrimaryColor,
                              height: ancho * 0.1,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: Center(
                                  child: Text(
                                    "Registrar",
                                    style: TextStyle(
                                        fontSize: ancho * 0.05,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  return createAlertDialog(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        barrierColor: const Color.fromRGBO(255, 255, 255, 0.3),
        //barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return AlertDialog(
            //contentPadding: const EdgeInsets.all(0),

            //backgroundColor: kPrimaryColor,
            //backgroundColor: Colors.transparent,
            backgroundColor: Colors.white,
            content: Column(
              children: [
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/registroConductor');
                      },
                      child: Container(
                        width: ancho / 2,
                        height: ancho / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: kPrimaryColor,
                          ),
                        ),
                        child: Center(
                          child: Image.asset("assets/icons/carro.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/registroEmpresa');
                      },
                      child: Container(
                        width: ancho / 2,
                        height: ancho / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: kPrimaryColor,
                          ),
                        ),
                        child: Center(
                          child: Image.asset("assets/icons/market.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
