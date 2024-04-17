
import 'package:sol_backoffice_api/src/models/localdata/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConConfiguraciones {
  
  static Future<SchConfiguraciones> obtenerConfiguracion(String configuracionJSON) async {
      SchConfiguraciones config =
        await ModConfiguracionesBase.obtenerConfiguraciones(configuracionJSON);
    return config;
  }

  static Future<SchConfiguraciones> controlarConfiguraciones(
      [SchConfiguraciones? config2, objeto, String configuracionJSON=""]) async {
    if (config2 != null) {
      if (config2.url == "") {
        config2 = await ConConfiguraciones.obtenerConfiguracion(configuracionJSON);
      }
    } else {
      config2 = await ConConfiguraciones.obtenerConfiguracion(configuracionJSON);
    }
    if (objeto != null) {
      objeto.schConfiguraciones ??= config2;
    }
    return config2;
  }
}
