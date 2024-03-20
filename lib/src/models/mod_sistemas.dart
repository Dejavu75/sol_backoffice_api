import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ModSistemas {
  String urlApi = '';
  Future<List<SchSistema>> obtenerSistemas([SchConfiguraciones? config]) async {
    if (config == null) {
      print("Obtener Configuraciones");
      config = await ConConfiguraciones().obtenerConfiguracion();
    }
    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi = '${config.url}sistema/obtener';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SchSistema.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Sistemas');
    }
  }
}
