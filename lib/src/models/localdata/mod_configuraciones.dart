import 'dart:convert';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'dart:io';

class ModConfiguracionesBase {
  String configFile = 'config.json';

  ModConfiguracionesBase([String configFile=""]){
    if (configFile != "") {
      this.configFile = configFile;
    }
  }

  Future<String> obtenerConfigString() async {
    try {
      final file = File(configFile);
      return await file.readAsString();
    } catch (e) {
      print ("No se pudo leer el archivo de configuración: $configFile ");
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
  Future<SchConfiguraciones> obtenerConfiguraciones(
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
