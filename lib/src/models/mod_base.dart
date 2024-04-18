import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ModBase{
   SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  controlarConfiguraciones([ModConfiguracionesApi? modConfiguraciones]) async {

    schConfiguraciones = await ConConfiguraciones.controlarConfiguraciones(schConfiguraciones, this,modConfiguraciones);
  }
  controlarInicio([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
    if (modConfiguraciones != null) {
      controlarConfiguraciones(modConfiguraciones);
    }
  }
}