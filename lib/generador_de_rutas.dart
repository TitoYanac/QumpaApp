import 'package:flutter/material.dart';
import 'Vistas/Conductor/principal_conductor.dart';
import 'Vistas/Empresa/drawer/configuracion_cuenta_empresa.dart';
import 'Vistas/Empresa/drawer/terminos_y_condiciones_empresa.dart';
import 'Vistas/Empresa/principal_empresa.dart';
import 'Vistas/Empresa/registro_empresa.dart';
import 'Bean/bean_cuenta_usuario.dart';
import 'Vistas/Conductor/drawer/configuracion_cuenta_conductor.dart';
import 'Vistas/Conductor/drawer/preguntas_frecuentes_conductor.dart';
import 'Vistas/recuperar_password.dart';
import 'Vistas/Conductor/drawer/terminos_y_condiciones_conductor.dart';
import 'Vistas/Conductor/registro_conductor.dart';
import 'Vistas/Empresa/Historial/historial_empresa.dart';
import 'Vistas/Empresa/drawer/preguntas_frecuentes_empresa.dart';
import 'login.dart';

class GeneradorDeRutas {
  static Route<dynamic> generarRuta(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/registroConductor':
        return MaterialPageRoute(builder: (_) => const RegistroConductor());
      case '/registroEmpresa':
        return MaterialPageRoute(builder: (_) => const RegistroEmpresa());
      case '/recuperarPassword':
        return MaterialPageRoute(builder: (_) => const RecuperarPassword());
      case '/terminosYCondicionesEmpresa':
        return MaterialPageRoute(
            builder: (_) =>
                TerminosYCondicionesEmpresa(settings.arguments as CuentaUsuario));

      case '/preguntasFrecuentesEmpresa':
        return MaterialPageRoute(
            builder: (_) =>
                PreguntasFrecuentesEmpresa(settings.arguments as CuentaUsuario));
      case '/cambiarPasswordEmpresa':
        return MaterialPageRoute(
            builder: (_) =>
                ConfiguracionCuentaEmpresa(settings.arguments as CuentaUsuario));


      case '/terminosYCondicionesConductor':
        return MaterialPageRoute(
            builder: (_) =>
                TerminosYCondicionesConductor(settings.arguments as CuentaUsuario));

      case '/preguntasFrecuentesConductor':
        return MaterialPageRoute(
            builder: (_) =>
                PreguntasFrecuentesConductor(settings.arguments as CuentaUsuario));
      case '/cambiarPasswordConductor':
        return MaterialPageRoute(
            builder: (_) =>
                ConfiguracionCuentaConductor(settings.arguments as CuentaUsuario));

      case '/principalConductor':
        return MaterialPageRoute(
            builder: (_) =>
                PrincipalConductor(settings.arguments as CuentaUsuario));

      case '/principalEmpresa':
        return MaterialPageRoute(
            builder: (_) =>
                PrincipalEmpresa(settings.arguments as CuentaUsuario));
      case '/historialEmpresa':
        return MaterialPageRoute(
            builder: (_) =>
                HistorialEmpresa(settings.arguments as CuentaUsuario));

      default:
        return rutaErronea();
    }
  }

  static Route<dynamic> rutaErronea() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
