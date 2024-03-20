import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/sol_backoffice_api_base.dart';

class ConConfiguraciones {
  final ModConfiguraciones modConfiguraciones = ModConfiguraciones();
  Future<SchConfiguraciones> obtenerConfiguracion() async {
    SchConfiguraciones config =
        await modConfiguraciones.obtenerConfiguraciones();
    return config;
  }
}
