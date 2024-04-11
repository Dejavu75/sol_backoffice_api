import 'dart:async';



import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConActualizaciones {
  ModActualizaciones modActualizaciones = ModActualizaciones();
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  ConActualizaciones([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }

  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
    await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, modActualizaciones);
    return modActualizaciones;
  }

  Future<List<SchActualizaciones>> obtenerActualizaciones([String version="",bool leer=false]) async {
    controlarConfiguraciones();
    List<SchActualizaciones> actualizacion = await modActualizaciones.obtenerActualizaciones(version, leer);
    return actualizacion;
  }
Future<SchActualizaciones> obtenerActualizacion([String version="",bool leer=false]) async {
    controlarConfiguraciones();
    SchActualizaciones actualizacion = await modActualizaciones.obtenerActualizacion(version, leer);
    return actualizacion;
  }

  Future<SchActualizaciones> obtenerUltimoActualizacion([leer=false]) {
    return modActualizaciones.obtenerActualizacion("27", leer);
  }
}
