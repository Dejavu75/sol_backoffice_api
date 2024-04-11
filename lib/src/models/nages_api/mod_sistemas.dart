import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ModSistemas {
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();

  String urlApi = '';
  ModSistemas([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }
  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
  }

  Future<List<SchSistema>> obtenerSistemas() async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi = '${schConfiguraciones.url}sistema/obtener_produccion';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<SchSistema> respuesta = jsonResponse.map((data) => SchSistema.fromMap(data)).toList();
      return respuesta;
    } else {
      throw Exception('Failed to load Sistemas');
    }
  }
}
