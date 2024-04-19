// ignore_for_file: overridden_fields

import 'dart:async';



import 'package:sol_backoffice_api/src/controllers/con_base.dart';
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';

import 'package:sol_backoffice_api/src/models/nages_api/mod_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConActualizaciones extends ConBase {
  ModActualizaciones modActualizaciones = ModActualizaciones();
  ConActualizaciones([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    modelo = modActualizaciones;
    controlarInicio(xconf, modConfiguraciones);
  }

  Future<List<SchActualizaciones>> obtenerActualizaciones([String version="",bool leer=false]) async {
    await controlarConfiguraciones();
    List<SchActualizaciones> actualizacion = await modActualizaciones.obtenerActualizaciones(version, leer);
    return actualizacion;
  }
  Future<SchActualizaciones> obtenerActualizacion([String version="",bool leer=false]) async {
    await controlarConfiguraciones();
    SchActualizaciones actualizacion = await modActualizaciones.obtenerActualizacion(version, leer);
    return actualizacion;
  }
  Future<SchActualizaciones> obtenerUltimoActualizacion([leer=false]) async {
    await controlarConfiguraciones();
    return await modActualizaciones.obtenerActualizacion("27", leer);
  }
}
