import 'dart:async';


import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ConSistemas {
  ModSistemas modSistemas = ModSistemas();
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();
  ConSistemas([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }

  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
    await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, modSistemas);
    return modSistemas;
  }

  Future<List<SchSistema>> obtenerSistemas() async {
    controlarConfiguraciones();
    List<SchSistema> sistemas = await modSistemas.obtenerSistemas();
    return sistemas;
  }
}
