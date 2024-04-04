import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/sol_backoffice_api_base.dart';

class ConConfiguraciones {
  final ModConfiguraciones modConfiguraciones = ModConfiguraciones();
  Future<SchConfiguraciones> obtenerConfiguracion() async {
    SchConfiguraciones config =
        await modConfiguraciones.obtenerConfiguraciones();
    return config;
  }

  Future<SchConfiguraciones> controlarConfiguraciones(
      [SchConfiguraciones? config2, objeto]) async {
    if (config2 != null) {
      if (config2.url == "") {
        config2 = await ConConfiguraciones().obtenerConfiguracion();
      }
    } else {
      config2 = await ConConfiguraciones().obtenerConfiguracion();
    }
    if (objeto != null) {
      objeto.schConfiguraciones ??= config2;
    }
    return config2;
  }
}
