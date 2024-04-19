import 'dart:async';



import 'package:sol_backoffice_api/src/controllers/con_base.dart';
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConBackups extends ConBase  {
  ModBackups modBackups = ModBackups();
  
  ConBackups([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    modelo = modBackups;
    controlarInicio(xconf, modConfiguraciones);
  }


  Future<List<SchBackups>> obtenerBackups([String keySistema="", leer=false]) async {
    await controlarConfiguraciones();
    List<SchBackups> sistemas = await modBackups.obtenerBackups(keySistema, leer);
    return sistemas;
  }
  Future<SchBackups> obtenerUltimoBackup(String keySistema, [leer=false]) async {
    await controlarConfiguraciones();
    return  await modBackups.obtenerUltimoBackup(keySistema, leer);
  }
}
