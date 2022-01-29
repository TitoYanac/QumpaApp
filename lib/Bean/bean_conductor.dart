import 'bean_persona.dart';
import 'bean_vehiculo.dart';

class Conductor {
  late String idChofer;
  late String tuc;
  late String numLicencia;
  late String fecExpedicionLic;

  late String imagenPoliza;
  late String fecVencSoat;
  late String imagenTuc;


  late Persona datosPersonales;


  Conductor(
    this.idChofer,
    this.tuc,
    this.numLicencia,
    this.fecExpedicionLic,
    this.imagenPoliza,
    this.fecVencSoat,
    this.imagenTuc,
    this.datosPersonales,
  );
}
