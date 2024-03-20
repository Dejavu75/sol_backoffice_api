import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';

class ModSistemas {
  String urlApi = 'https://nages.solinges.com.ar:444/ages/sistema/obtener';
  Future<List<SchSistema>> obtenerSistemas() async {
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SchSistema.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Sistemas');
    }
  }
}
