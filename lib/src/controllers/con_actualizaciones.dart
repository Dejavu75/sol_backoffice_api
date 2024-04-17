// ignore_for_file: overridden_fields

import 'dart:async';



import 'package:sol_backoffice_api/src/controllers/con_base.dart';

import 'package:sol_backoffice_api/src/models/nages_api/mod_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConActualizaciones extends ConBase {
  ModActualizaciones modActualizaciones = ModActualizaciones();
  ConActualizaciones([SchConfiguraciones? xconf, String configJson=""]) {
    modelo = modActualizaciones;
    controlarInicio(xconf, configJson);
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
    controlarConfiguraciones();
    return modActualizaciones.obtenerActualizacion("27", leer);
  }
}
