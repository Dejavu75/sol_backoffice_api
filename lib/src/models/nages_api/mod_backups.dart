// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sol_backoffice_api/sol_backoffice_api.dart';
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';

class ModBackups {
  SchConfiguraciones schConfiguraciones = SchConfiguraciones();

  String urlApi = '';
  ModBackups([SchConfiguraciones? xconf]) {
    if (xconf != null) {
      schConfiguraciones = xconf;
    }
  }

  controlarConfiguraciones() async {
    schConfiguraciones = await ConConfiguraciones()
        .controlarConfiguraciones(schConfiguraciones, this);
  }

  Future<List<SchBackups>> obtenerBackups([key_sistema = ""]) async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/obtener${key_sistema.isNotEmpty ? '/' + key_sistema : ''}';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SchBackups.fromMap(data)).toList();
    } else {
      throw Exception('Failed to load backups');
    }
  }

  Future<SchBackups> obtenerUltimoBackup([key_sistema = ""]) async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/ultimo${key_sistema.isNotEmpty ? '/' + key_sistema : ''}';
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      SchBackups jsonResponse = SchBackups.fromMap(json.decode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to load backups');
    }
  }

  //Funcion para obtener el ultimo backup de un sistema de la lista obtenerBackups

}
