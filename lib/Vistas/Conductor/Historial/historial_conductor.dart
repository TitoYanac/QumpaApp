import 'package:flutter/material.dart';
import '../../../Bean/bean_cuenta_usuario.dart';
import '../../../constantes.dart';
import 'En_Reparto/historial_en_reparto.dart';
import 'Finalizado/historial_finalizado.dart';
class HistorialConductor extends StatefulWidget {
  final CuentaUsuario usuarioConductor;
  const HistorialConductor(this.usuarioConductor, {Key? key}) : super(key: key);

  @override
  _HistorialConductorState createState() => _HistorialConductorState();
}

class _HistorialConductorState extends State<HistorialConductor>
    with TickerProviderStateMixin {
  late double ancho;
  late double aux;
  late double alto;
  late double relacionEstandar;
  late double relacionActual;
  late double relacionBanner;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
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
    return Column(
      children: <Widget>[
        TabBar(

          tabs: [
            Container(
              height: alto*0.07,
              //color: Colors.blue,
              child: Center(
                child: Text(
                  'EN REPARTO',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: ancho*0.035, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: alto*0.07,
              //color: Colors.green,
              child: Center(
                child: Text(
                  'FINALIZADOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: ancho*0.035, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
          unselectedLabelColor: Colors.black54,
          indicatorColor: kPrimaryColor,
          labelColor: kPrimaryColor,

          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3.0,
          // indicatorPadding: EdgeInsets.all(0),
          isScrollable: false,
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              HistorialEnReparto(widget.usuarioConductor),
              HistorialFinalizado(widget.usuarioConductor)
            ],
          ),
        ),
      ],
    );
  }
}
