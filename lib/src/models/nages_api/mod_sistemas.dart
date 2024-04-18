import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';


import 'package:sol_backoffice_api/src/models/mod_base.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ModSistemas  extends ModBase{
  
  String urlApi = '';
  ModSistemas([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    controlarInicio(xconf, modConfiguraciones);
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
