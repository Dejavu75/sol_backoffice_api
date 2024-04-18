import 'package:sol_backoffice_api/src/models/localdata/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ModConfiguracionesApi extends ModConfiguracionesBase {}

class ConConfiguraciones {
  static Future<SchConfiguraciones> obtenerConfiguracion([ModConfiguracionesApi? modConfiguraciones]) async {
    if (modConfiguraciones != null) {
      return await modConfiguraciones.obtenerConfiguracionesString();
    } else {
      SchConfiguraciones config =
          await ModConfiguracionesBase.obtenerConfiguraciones('');
      return config;
    }
  }

  static Future<SchConfiguraciones> controlarConfiguraciones(
      [SchConfiguraciones? config2,
      objeto,modConfiguraciones]) async {
    if (config2 != null) {
      if (config2.url == "") {
        config2 =
            await ConConfiguraciones.obtenerConfiguracion(modConfiguraciones);
      }
    } else {
      config2 =
          await ConConfiguraciones.obtenerConfiguracion(modConfiguraciones);
    }
    if (objeto != null) {
      objeto.schConfiguraciones ??= config2;
    }
    return config2;
  }
}
