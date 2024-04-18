import 'dart:convert';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'dart:io';

class ModConfiguracionesBase {
  static Future<String> obtenerConfigString() async {
    try {
      final file = File('config.json');
      return await file.readAsString();
    } catch (e) {
      return '';
    }
  }
  
  Future<SchConfiguraciones> obtenerConfiguracionesString(
      [String configString=""]) async {
    String raw = '';
    try {
      // ignore: prefer_typing_uninitialized_variables
      var configData;
      if (configString != "") {
        raw = configString;
      } else {
        try {
          raw = await obtenerConfigString();
        } catch (e) {
          return SchConfiguraciones(
              conexion_actual: 0,
              url: '',
              nombre: '',
              conexiones: [],
              usuario: '',
              apikey: '');
        }
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
  static Future<SchConfiguraciones> obtenerConfiguraciones(
      String configString) async {
    String raw = '';
    try {
      // ignore: prefer_typing_uninitialized_variables
      var configData;
      if (configString != "") {
        raw = configString;
      } else {
        try {
          raw = await obtenerConfigString();
        } catch (e) {
          return SchConfiguraciones(
              conexion_actual: 0,
              url: '',
              nombre: '',
              conexiones: [],
              usuario: '',
              apikey: '');
        }
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
