// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sol_backoffice_api/sol_backoffice_api.dart';
import 'package:sol_backoffice_api/src/controllers/con_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/mod_base.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';

class ModBackups extends ModBase{

  String urlApi = '';
  ModBackups([SchConfiguraciones? xconf, ModConfiguracionesApi? modConfiguraciones]) {
    controlarInicio(xconf, modConfiguraciones);
  }

  Future<List<SchBackups>> obtenerBackups([String key_sistema = "", leer=false]) async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/obtener${leer ? '/leer':''}${key_sistema.isNotEmpty ? '/' + key_sistema : ''}';
    //print(urlApi);
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SchBackups.fromMap(data)).toList();
    } else {
      throw Exception('Failed to load backups');
    }
  }
 Future<List<SchBackups>> obtenerUltimosBackups([key_sistema = "", leer=false]) async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/ultimos/${leer ? 'leer/':''}${key_sistema.isNotEmpty ? '' + key_sistema : ''}';
    //print(urlApi);        
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SchBackups.fromMap(data)).toList();
    } else {
      throw Exception('Failed to load backups');
    }
  }
  Future<SchBackups> obtenerUltimoBackup([key_sistema = "", leer=false]) async {
    await controlarConfiguraciones();

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/ultimo${leer ? '/leer':''}${key_sistema.isNotEmpty ? '/' + key_sistema : ''}';
    //print(urlApi);        
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      
      SchBackups jsonResponse = SchBackups.fromMap(json.decode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to load backups');
    }
  }
 Future<String> actualizarBackup(String key_sistema, SchBackups backup) async {
    await controlarConfiguraciones();
    var estado=1;
    if (backup.okGeneral==true) {
        estado=1;
    } else if (backup.okData==false) {
        estado=2;
   } else if (backup.okNormal==false) {
        estado=3;
    }

    //config = await ModConfiguraciones().obtenerConfiguraciones();
    final urlApi =
        '${schConfiguraciones.url}sistemas/backups/cambiar_estado/$key_sistema/$estado';
    //print(urlApi);
    
    final response = await http.post(Uri.parse(urlApi), body:json.encode(backup.toMap()));
    if (response.statusCode == 200) {
      return response.body;
    } else {

      return 'Error';
    }
  }
  //Funcion para obtener el ultimo backup de un sistema de la lista obtenerBackups
}
