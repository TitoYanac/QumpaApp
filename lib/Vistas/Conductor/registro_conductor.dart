import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../constantes.dart';

class RegistroConductor extends StatefulWidget {
  const RegistroConductor({Key? key}) : super(key: key);
  @override
  _RegistroConductorState createState() => _RegistroConductorState();
}

class _RegistroConductorState extends State<RegistroConductor> {
  bool _nombre = true;
  bool _apellido = true;
  bool _documento = true;
  bool _celular = true;
  bool _correo = true;
  bool _pass1 = true;
  bool _pass2 = true;
  bool _terminos = true;

  String miActualCategoria = "--Seleccionar--";
  String miNumEnviosActual = "--Seleccionar--";
  bool _categoria = true;

  bool _misEnvios = true;

  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  //List<String> miUsuario;

  bool checkSize0 = false;
  bool checkSize1 = false;
  bool checkSize2 = false;
  bool checkSize4 = false;
  bool checkSize5 = false;
  bool _checked = false;

  String sizeProduct = "";
  String delicado = "";

  String terminos = "0";

  final _keyCrearEnvio = GlobalKey<FormState>();

  final TextEditingController ruc = TextEditingController();

  final TextEditingController correo = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellido = TextEditingController();
  final TextEditingController dni = TextEditingController();
  final TextEditingController celular = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController dist = TextEditingController();
  late String miActualDistrito = "- - Seleccionar Distrito - -";
  final TextEditingController producto = TextEditingController();

  final TextEditingController size = TextEditingController();
  final TextEditingController estado = TextEditingController();
  final TextEditingController descripcion = TextEditingController();

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
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: alto * 0.02, horizontal: ancho * 0.06),
        child: Form(
          key: _keyCrearEnvio,
          child: ListView(
            children: <Widget>[
              SizedBox(
                //color: Colors.red,
                height: alto * 0.09,
                width: ancho,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: alto * 0.02),
                      child: Text(
                        "Registro QUMPA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ancho * 0.06,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        child: Container(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: ancho * 0.08,
                          ),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/icons/carro.png",
                  width: ancho * 0.4,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Text(
                "Información Personal:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Nombre:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: ancho * 0.04,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          child: TextFormField(
                            controller: nombre,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _nombre ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _nombre ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: Text(
                            "Apellido:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ancho * 0.01),
                          child: TextFormField(
                            controller: apellido,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _apellido ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _apellido ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Documento (DNI):",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: ancho * 0.01,),
                          //height: alto * 0.07,
                          child: TextFormField(
                            controller: dni,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _documento ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _documento ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: ancho * 0.01),
                          child: Text(
                            "Celular:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ancho * 0.01, ),
                          child: TextFormField(
                            controller: celular,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _celular ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _celular ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.02,
              ),

              Text(
                "Datos de Acceso:",
                style: TextStyle(
                  fontSize: ancho * 0.06,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: alto * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "E-mail:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          //height: alto * 0.04,
                          child: TextFormField(
                            controller: correo,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            expands: false,
                            enableSuggestions: false,
                            style: TextStyle(
                              fontSize: ancho * 0.04,
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              hintText: "",
                              isDense: true,
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _correo ? kPrimaryColor : Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  _correo ? kPrimaryColor : Colors.red,
                                  width: 2,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: alto * 0.03,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ancho * 0.08,
                    height: ancho * 0.08,
                    child: Icon(
                      Icons.lock,
                      color: _pass1 ? kPrimaryColor : Colors.red,
                      size: ancho * 0.08,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: pass1,
                     // maxLength: 32,
                      obscureText: !_passwordVisible1,
                      style: TextStyle(fontSize: ancho * 0.04),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: ancho * 0.04),
                        isDense: true,
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                            _pass1 ? kPrimaryColor : Colors.red,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                            _pass1 ? kPrimaryColor : Colors.red,
                            width: 2,
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
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
                        color: _pass1 ? kPrimaryColor : Colors.red,
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

              SizedBox(
                height: alto * 0.03,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ancho * 0.08,
                    height: ancho * 0.08,
                    child: Icon(
                      Icons.lock,
                      color: _pass2 ? kPrimaryColor : Colors.red,
                      size: ancho * 0.08,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: pass2,
                     // maxLength: 32,
                      obscureText: !_passwordVisible2,
                      style: TextStyle(fontSize: ancho * 0.04),
                      decoration: InputDecoration(
                        hintText: 'Confirmar Password',
                        hintStyle: TextStyle(fontSize: ancho * 0.04),
                        isDense: true,
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                            _pass2 ? kPrimaryColor : Colors.red,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                            _pass2 ? kPrimaryColor : Colors.red,
                            width: 2,
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: alto*0.01,horizontal: ancho*0.01),
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
                        color: _pass2 ? kPrimaryColor : Colors.red,
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

              SizedBox(
                height: alto * 0.04,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: _terminos ? kPrimaryColor : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: alto * 0.01),
                child: CheckboxListTile(
                  title: Text(
                    "Acepto los Términos y Condiciones de Qumpa para el tratamiento de mis datos.",
                    style: TextStyle(fontSize: ancho * 0.04),
                  ),
                  secondary: Icon(
                    Icons.beach_access,
                    color: _checked ? kPrimaryColor : Colors.grey,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checked,
                  onChanged: (value) {
                    setState(() {
                      _checked = value!;
                      if (_checked) {
                        terminos = "1";
                      } else {
                        terminos = "0";
                      }
                    });
                  },
                  activeColor: kPrimaryColor,
                  checkColor: Colors.white,
                  dense: true,
                ),
              ),
              SizedBox(
                height: alto * 0.02,
              ),

              Container(
                margin: EdgeInsets.only(bottom: alto * 0.04),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    //crearFicha();
                    setState(() {
                      _nombre = RegExp(
                              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
                          .hasMatch(nombre.text);
                      _apellido = RegExp(
                              r"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]*$")
                          .hasMatch(apellido.text);
                      _documento = RegExp(r"^[0-9]{8}$").hasMatch(dni.text);
                      _celular = RegExp(r"^[0-9]{9}$").hasMatch(celular.text);
                      _correo = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(correo.text);
                      _pass1 =
                          !pass1.text.contains(" ") && pass1.text.isNotEmpty;
                      _pass2 = !pass2.text.contains(" ") &&
                          pass2.text.isNotEmpty &&
                          pass1.text == pass2.text;
                      _terminos = _checked;
                    });

                    print("datos recibidos:\n");
                    print("_nombre: $_nombre");
                    print("_apellido: $_apellido");
                    print("_documento: $_documento");
                    print("_celular: $_celular");
                    print("_correo: $_correo");
                    print("_pass1: $_pass1");
                    print("_pass2: $_pass2");
                    print("_terminos: $_terminos");

                    if (_nombre &&
                        _apellido &&
                        _documento &&
                        _celular &&
                        _correo &&
                        _pass1 &&
                        _pass2 &&
                        _checked) {
                      /*
                      print("datos a registrar: \n");
                      print("nombre: ${nombre.text}");
                      print("apellido: ${apellido.text}");
                      print("documento: ${dni.text}");
                      print("celular: ${celular.text}");
                      print("correo: ${correo.text}");
                      print("pass1: ${pass1.text}");
                      print("pass2: ${pass2.text}");
                      print("terminos: ${_checked?1:0}");

                       */
                      RegistrarConductor(
                          nombre.text,
                          apellido.text,
                          dni.text,
                          celular.text,
                          correo.text,
                          pass2.text,
                          _checked ? '1' : '0');
                    } else {
                      Error("Verifique los datos ingresados.", ancho, context);
                    }
                  },
                  child: Text(
                    'REGISTRAR CONDUCTOR',
                    style:
                        TextStyle(color: Colors.white, fontSize: ancho * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future RegistrarConductor(String nombre, String apellido, String documento,
      String celular, String correo, String pass, String term) async {
    String url = "$servidor/Conductor/App_registrar_conductor.php";
    var response = await post(Uri.parse(url), body: {
      "nombre": nombre,
      "apellido": apellido,
      "documento": documento,
      "celular": celular,
      "correo": correo,
      "pass": pass,
      "terminos": term,
    });
    print("response: $response");
    print("response.statusCode: ${response.statusCode}");
    print("response.body: ${response.body}");

    var data = jsonDecode(response.body);
    print(data);
    print(data["0"]);
    if (data["0"] == "1") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registro Exitoso!\nBienvenido a la familia QUMPA!!")));

//redireccionar

      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Este correo ya ha sido Registrado.\nNos pondremos en contacto con usted!")));
    }
  }
}
