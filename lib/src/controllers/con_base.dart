import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/mod_base.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConBase {
  // ignore: prefer_typing_uninitialized_variables
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  late ModBase modelo;
  ConBase([SchConfiguraciones? xconf, String configJson = ""]) {
    controlarInicio(xconf, configJson);
  }
  controlarInicio([SchConfiguraciones? xconf, String configJson = ""]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
    if (configJson != "") {
      controlarConfiguraciones(configJson);
    }
  }

  getModelo() {
    return null;
  }

  controlarConfiguraciones([String configJson = ""]) async {
    var modelo = getModelo();
    schConfiguraciones = await ConConfiguraciones.controlarConfiguraciones(
        schConfiguraciones, this, configJson);
    await ConConfiguraciones.controlarConfiguraciones(
        schConfiguraciones, modelo, configJson);
    return modelo;
  }
}
