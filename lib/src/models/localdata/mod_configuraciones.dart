import 'dart:convert';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class ModConfiguracionesBase {
  Future<SchConfiguraciones> obtenerConfiguraciones() async {
    String raw = '';
    try {
      // ignore: prefer_typing_uninitialized_variables
      var configData;
      try {
        final file = File('config.json');
        raw = await file.readAsString();
      } catch (e) {
        raw = await rootBundle.loadString('config.json');
      }
      configData = json.decode(raw);
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
