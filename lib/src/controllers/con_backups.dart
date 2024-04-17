import 'dart:async';



import 'package:sol_backoffice_api/src/controllers/con_base.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConBackups extends ConBase  {
  ModBackups modBackups = ModBackups();
  
  ConBackups([SchConfiguraciones? xconf, String configJson=""]) {
    modelo = modBackups;
    controlarInicio(xconf, configJson);
  }


  Future<List<SchBackups>> obtenerBackups([String keySistema="", leer=false]) async {
    controlarConfiguraciones();
    List<SchBackups> sistemas = await modBackups.obtenerBackups(keySistema, leer);
    return sistemas;
  }
  Future<SchBackups> obtenerUltimoBackup(String keySistema, [leer=false]) {
    controlarConfiguraciones();
    return modBackups.obtenerUltimoBackup(keySistema, leer);
  }
}
