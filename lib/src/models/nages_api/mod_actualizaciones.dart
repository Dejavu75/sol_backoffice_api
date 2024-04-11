// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_actualizaciones.dart';

class ModActualizaciones {
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();

  String urlApi = '';
  ModActualizaciones([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }

  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
  }

  Future<List<SchActualizaciones>> obtenerActualizaciones(
      [String version = "27", bool leer = false]) async {
    await controlarConfiguraciones();
    final urlApi ='${schConfiguraciones.url}internos/actualizaciones${version.isNotEmpty ? '/' + version : ''}';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<SchActualizaciones> respuesta = jsonResponse
          .map((data) => SchActualizaciones.fromMap(data))
          .toList();
          return respuesta;
    } else {
      throw Exception('Failed to load actualizaciones');
    }
  }

  Future<SchActualizaciones> obtenerActualizacion(String version,
      [bool leer = false]) async {
    await controlarConfiguraciones();
    final urlApi = '${schConfiguraciones.url}internos/actualizaciones${'/' + version}';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      
      return SchActualizaciones.fromMap( json.decode(response.body));
    } else {
      throw Exception('Failed to load actualizaciones');
    }
  }
}
