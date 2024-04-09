// ignore_for_file: unused_import

import 'dart:math';

import 'package:sol_backoffice_api/sol_backoffice_api.dart';
import 'package:sol_backoffice_api/src/controllers/con_sistemas.dart';
import 'package:sol_backoffice_api/src/models/localdata/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_actualizaciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';
import 'package:test/test.dart';

import 'package:sol_backoffice_api/src/models/nages_api/mod_backups.dart';

void main() async {
  late ModConfiguracionesBase modConfiguraciones;
  late SchConfiguraciones xconf;
  late ConSistemas conSistemas;
  late List<SchSistema> curSistemas;
  group('Configuraciones', () {
    test('obtenerConfiguraciones debe retornar una configuracion válida',
        () async {
      modConfiguraciones = ModConfiguracionesBase();
      xconf = await modConfiguraciones.obtenerConfiguraciones();
      expect(xconf, isA<SchConfiguraciones>(),
          reason: "No es SchConfiguraciones");
      expect(xconf.url, isNotNull, reason: "No tiene url");
    });
  });
  group('Sistemas', () {
    test('obtenerSistemas debe retornar una lista de sistemas válida',
        () async {
      conSistemas = ConSistemas();
      curSistemas = await conSistemas.obtenerSistemas();
      expect(curSistemas, isA<List<SchSistema>>(),
          reason: "No es List<SchSistemas>");
      expect(curSistemas.length, greaterThan(0), reason: "No tiene sistemas");
      print("Sisemas: ${curSistemas.length}");
    });
  });
  group('Backups', () {
    late ModBackups modBackups;
    late List<SchBackups> backups2 = [];

    test('Revisar Backups de un sistema', () async {
      modBackups = ModBackups();
      backups2 = await modBackups.obtenerBackups();
      expect(backups2, isA<List<SchBackups>>(),
          reason: "No es List<SchBackups>");
      print("Backups: ${backups2.length}");
    });

    test('Revisar Backups MAX_SN', () async {
      List<SchBackups> backups2 = [];
      modBackups = ModBackups();
      backups2 = await modBackups.obtenerBackups("AVI 1");
      expect(backups2, isA<List<SchBackups>>(),
          reason: "No es List<SchBackups>");
      print("Backups: ${backups2.length}");
    });
  });

  group('Actualizaciones', () {
    late ModActualizaciones modActualizaciones;
   // late List<SchActualizaciones> actualizaciones2 = [];
    late SchActualizaciones actualizacion;

    test('Revisar Backups de un sistema', () async {
      modActualizaciones=ModActualizaciones();
      actualizacion = await modActualizaciones.obtenerActualizaciones();
      expect(actualizacion, isA<SchActualizaciones>(),
          reason: "No es SchActualizaciones");
      print("Backups: $actualizacion");
    });


  });  
}
