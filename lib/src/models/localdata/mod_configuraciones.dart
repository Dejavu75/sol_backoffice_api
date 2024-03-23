import 'dart:convert';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'dart:io';

class ModConfiguracionesBase {
  Future<SchConfiguraciones> obtenerConfiguraciones() async {
    String raw = '';
    try {
      final file = File('config.json');
      raw = await file.readAsString();
      var configData = json.decode(raw);
      SchConfiguraciones config2 = SchConfiguraciones.fromJson(configData);
      return config2;
    } catch (e) {
      print('Error al leer el archivo de configuración: $e');
      return SchConfiguraciones(
          conexion_actual: 0,
          url: '',
          nombre: '',
          conexiones: [],
          usuario: '',
          apikey: '');
    }
  }
}
