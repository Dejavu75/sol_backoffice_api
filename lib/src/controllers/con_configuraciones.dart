import 'package:sol_backoffice_api/src/models/localdata/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ModConfiguracionesApi extends ModConfiguracionesBase {}

class ConConfiguraciones {
  static Future<SchConfiguraciones> obtenerConfiguracion([ModConfiguracionesApi? modConfiguraciones, String configFile=""]) async {
    if (modConfiguraciones != null) {
      if (configFile != "") {
        modConfiguraciones.configFile = configFile;
      } 
      return await modConfiguraciones.obtenerConfiguracionesString();
    } else {
      SchConfiguraciones config =
          await ModConfiguracionesBase(configFile).obtenerConfiguraciones('');
      return config;
    }
  }

  static Future<SchConfiguraciones> controlarConfiguraciones(
      [SchConfiguraciones? config2,
      objeto,modConfiguraciones, String configFile=""]) async {
    if (config2 != null) {
      if (config2.url == "") {
        config2 =
            await ConConfiguraciones.obtenerConfiguracion(modConfiguraciones, configFile);
      }
    } else {
      config2 =
          await ConConfiguraciones.obtenerConfiguracion(modConfiguraciones,configFile);
    }
    if (objeto != null) {
      objeto.schConfiguraciones = config2;
    }
    return config2;
  }
}
