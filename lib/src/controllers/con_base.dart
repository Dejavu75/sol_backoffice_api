import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/mod_base.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConBase {
  // ignore: prefer_typing_uninitialized_variables
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  late ModBase modelo;
  ConBase([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    controlarInicio(xconf, modConfiguraciones);
  }
  controlarInicio([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
    if (modConfiguraciones != null) {
      controlarConfiguraciones(modConfiguraciones);
    }
  }

  getModelo() {
    print("getModelo: $modelo");
    return modelo;
  }

  controlarConfiguraciones([ModConfiguracionesApi? modConfiguraciones]) async {
    var modelo = getModelo();
    schConfiguraciones = await ConConfiguraciones.controlarConfiguraciones(
        schConfiguraciones, this, modConfiguraciones);
    await ConConfiguraciones.controlarConfiguraciones(
        schConfiguraciones, modelo, modConfiguraciones);
    return modelo;
  }
}
