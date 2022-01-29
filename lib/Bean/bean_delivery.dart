import 'bean_ficha.dart';
import 'bean_vehiculo.dart';

class Delivery {
  late String idEntrega;
  late Vehiculo vehiculo;
  late Ficha datosFicha;
  late String fechaRecepcion;
  late String fechaEntrega;
  late String foto;

  Delivery(
    this.idEntrega,
    this.vehiculo,
    this.datosFicha,
    this.fechaRecepcion,
    this.fechaEntrega,
    this.foto,
  );
}
