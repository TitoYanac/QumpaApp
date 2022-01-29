import 'package:qumpa/Bean/bean_vehiculo.dart';

import 'bean_empresa.dart';
import 'bean_persona.dart';

class CuentaUsuario {
  late String idCuentaUsuario;
  late String correo;
  late String pass;
  late String tipoCuenta;
  late String estado;
  late String terminosYcondiciones;
  late Empresa empresa;
  late Persona persona;

  late Vehiculo vehiculo;

  CuentaUsuario(
      this.idCuentaUsuario,
      this.correo,
      this.pass,
      this.tipoCuenta,
      this.estado,
      this.terminosYcondiciones,
      this.empresa,
      this.persona,
      this.vehiculo);
}
