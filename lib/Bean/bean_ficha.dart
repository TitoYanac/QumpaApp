import 'package:qumpa/Bean/bean_cuenta_usuario.dart';

import 'bean_empresa.dart';
import 'bean_persona.dart';
import 'bean_producto.dart';

class Ficha {
  late String idFicha;
  //destino
  late String direccionDestino;
  late String referenciaDestino;
  late String idDistritoDestino;
  //origen
  late String direccionRecojo;
  late String referenciaRecojo;
  late String DistritoRecojo;
  //producto
  late String producto;
  late String delicado;
  late String descripcionProducto;
  late String sizeProduct;
  //comprador
  late String nombreComprador;
  late String apellidoComprador;
  late String documentoComprador;
  late String celularComprador;
  late String correoComprador;
  //ficha
  late String idTipoEnvio;
  late String idEmpresa;
  late String estado;
  late String monto;
  late String coordOrigen;
  late String coordDestino;
  late String km;
  late String seguro;
  late String notasAdicionales;
  late String comprobante;
  late String promocion;
  late String codigo;
  late String fechaCreacion;
  late String nombreEmpresaOrigen;
  late String rucEmpresa;

  @override
  String toString() {
    return 'Ficha{idFicha: $idFicha, direccionDestino: $direccionDestino, referenciaDestino: $referenciaDestino, idDistritoDestino: $idDistritoDestino, direccionRecojo: $direccionRecojo, referenciaRecojo: $referenciaRecojo, idDistritoRecojo: $DistritoRecojo, producto: $producto, delicado: $delicado, descripcionProducto: $descripcionProducto, sizeProduct: $sizeProduct, nombreComprador: $nombreComprador, apellidoComprador: $apellidoComprador, documentoComprador: $documentoComprador, celularComprador: $celularComprador, correoComprador: $correoComprador, idTipoEnvio: $idTipoEnvio, idEmpresa: $idEmpresa, estado: $estado, monto: $monto, coordOrigen: $coordOrigen, coordDestino: $coordDestino, km: $km, seguro: $seguro, notasAdicionales: $notasAdicionales, comprobante: $comprobante, promocion: $promocion, codigo: $codigo, fechaCreacion: $fechaCreacion, nombreEmpresaOrigen: $nombreEmpresaOrigen, rucEmpresa: $rucEmpresa}';
  }

  Ficha(
      //destino
      this.idFicha,
      this.direccionDestino,
      this.referenciaDestino,
      this.idDistritoDestino,
      //origen
      this.direccionRecojo,
      this.referenciaRecojo,
      this.DistritoRecojo,
      //producto
      this.producto,
      this.delicado,
      this.descripcionProducto,
      this.sizeProduct,
      //comprador
      this.nombreComprador,
      this.apellidoComprador,
      this.documentoComprador,
      this.celularComprador,
      this.correoComprador,
      //ficha
      this.idTipoEnvio,
      this.idEmpresa,
      this.estado,
      this.monto,
      this.coordOrigen,
      this.coordDestino,
      this.km,
      this.seguro,
      this.notasAdicionales,
      this.comprobante,
      this.promocion,
      this.codigo,
      this.fechaCreacion,
      this.nombreEmpresaOrigen,
      this.rucEmpresa,
  );
}
