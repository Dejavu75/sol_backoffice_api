import 'dart:async';


import 'package:sol_backoffice_api/src/controllers/con_base.dart';

import 'package:sol_backoffice_api/src/models/nages_api/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ConSistemas extends ConBase{
  ModSistemas modSistemas = ModSistemas();
  ConSistemas([SchConfiguraciones? xconf, String configJson=""]) {
    modelo = modSistemas;
    controlarInicio(xconf, configJson);
  }
 
  Future<List<SchSistema>> obtenerSistemas() async {
    controlarConfiguraciones();
    List<SchSistema> sistemas = await modSistemas.obtenerSistemas();
    return sistemas;
  }
}
