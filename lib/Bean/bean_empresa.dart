import 'bean_ubicacion.dart';

class Empresa {
  late String idCuentaEmpresa;
  late String nombreComercial;
  late String ruc;
  late String categoria;
  late String numEnviosMensuales;
  late String descripcion;
  late Ubicacion ubicacionEmpresa;

  Empresa(
    this.idCuentaEmpresa,
    this.nombreComercial,
    this.ruc,
    this.categoria,
    this.numEnviosMensuales,
    this.descripcion,
    this.ubicacionEmpresa,
  );

}
