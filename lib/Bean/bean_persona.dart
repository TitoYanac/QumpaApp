import 'bean_empresa.dart';
import 'bean_ubicacion.dart';

class Persona {
  late String idPersona;
  late String nombre;
  late String apellido;
  late String dni;
  late String celular;
  late Ubicacion domicilioPersona;
  Persona(
      this.idPersona,
      this.nombre,
      this.apellido,
      this.dni,
      this.celular,
      this.domicilioPersona);
}
