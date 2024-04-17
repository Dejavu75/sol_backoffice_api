// ignore_for_file: unused_import, unused_local_variable

import 'dart:math';

import 'package:sol_backoffice_api/src/controllers/con_actualizaciones.dart';
import 'package:sol_backoffice_api/src/controllers/con_sistemas.dart';
import 'package:sol_backoffice_api/src/models/localdata/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_actualizaciones.dart';
import 'package:sol_backoffice_api/src/models/nages_api/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_actualizaciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';
import 'package:test/test.dart';

import 'package:sol_backoffice_api/src/models/nages_api/mod_backups.dart';

void main() async {
  late ModConfiguracionesBase modConfiguraciones;
  late SchConfiguraciones xconf;
  late ConSistemas conSistemas;

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
      late List<SchSistema> curSistemas;
      curSistemas = await conSistemas.obtenerSistemas();
      expect(curSistemas, isA<List<SchSistema>>(),
          reason: "No es List<SchSistemas>");
      expect(curSistemas.length, greaterThan(0), reason: "No tiene sistemas");
      print("Sistemas: ${curSistemas.length}");
    });
  });
  group('Backups', () {
    late ModBackups modBackups;
    late List<SchBackups> backups2 = [];
    late SchBackups backups;
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
    test('Revisar Backups MAX_SN', () async {
      List<SchBackups> backups2 = [];
      modBackups = ModBackups();
      backups = await modBackups.obtenerUltimoBackup("AVI 1");
      expect(backups2, isA<List<SchBackups>>(),
          reason: "No es List<SchBackups>");
      print("Backups: ${backups2.length}");
    });
  });

  group('Actualizaciones', () {
    ConActualizaciones conActualizaciones = ConActualizaciones();
    late List<SchActualizaciones> actualizaciones;
    late SchActualizaciones actualizacion;

    test('Revisar actualizaciones', () async {
      actualizaciones = await conActualizaciones.obtenerActualizaciones(); 
      expect(actualizaciones, isA<List<SchActualizaciones>>(),
          reason: "No es SchActualizaciones");
    });
    test('Revisar actualización', () async {
      actualizacion = await conActualizaciones.obtenerActualizacion("27");
      expect(actualizacion, isA<SchActualizaciones>(),
          reason: "No es SchActualizaciones");
      print("Backups: $actualizacion");
    });
  });
}
