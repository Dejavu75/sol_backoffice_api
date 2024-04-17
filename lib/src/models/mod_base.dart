import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ModBase{
   SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  controlarConfiguraciones([ String configJson = ""]) async {

    schConfiguraciones = await ConConfiguraciones.controlarConfiguraciones(schConfiguraciones, this,configJson);
  }
  controlarInicio([SchConfiguraciones? xconf, String configJson = ""]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
    if (configJson != "") {
      controlarConfiguraciones(configJson);
    }
  }
}