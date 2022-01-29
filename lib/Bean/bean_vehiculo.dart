
import 'bean_conductor.dart';

class Vehiculo {
  late String idVehiculo;
  late String numPlaca;
  late String colorVehiculo;
  late String anotaciones;
  late String placaVigente;
  late String placaAnterior;

  late String marca;
  late String modelo;
  late String estadoVehiculo;

  late Conductor chofer;

  Vehiculo(
      this.idVehiculo,
      this.numPlaca,
      this.colorVehiculo,
      this.anotaciones,
      this.placaVigente,
      this.placaAnterior,

      this.marca,
      this.modelo,
      this.estadoVehiculo,

      this.chofer);
}
