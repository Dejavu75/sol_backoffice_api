import 'dart:async';


import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';

class ConBackups {
  ModBackups modBackups = ModBackups();
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  ConBackups([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }

  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
    await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, modBackups);
    return modBackups;
  }

  Future<List<SchBackups>> obtenerBackups() async {
    controlarConfiguraciones();
    List<SchBackups> sistemas = await modBackups.obtenerBackups();
    return sistemas;
  }
  Future<SchBackups> obtenerUltimoBackup(String keySistema) {
    return modBackups.obtenerUltimoBackup(keySistema);
  }
}
