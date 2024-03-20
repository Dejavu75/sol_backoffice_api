import 'package:sol_backoffice_api/src/controllers/con_sistemas.dart';
import 'package:sol_backoffice_api/src/models/mod_backups.dart';
import 'package:sol_backoffice_api/src/models/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_backups.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';
import 'package:test/test.dart';

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
    // test('Revisar Backups MAX_SN', () async {
    //   modBackups = ModBackups();
    //   backups2 = modBackups.obtenerBackups("MAX_SN");
    //   expect(backups2, isA<List<SchBackups>>(),
    //       reason: "No es List<SchBackups>");
    //   expect(backups2.length, greaterThan(0), reason: "No tiene backups");
    //   print("Backups: ${backups2.length}");

    //   for (var element in backups2) {
    //     print(
    //         "Sistema: ${element.keySistema} Fecha: ${element.fecha} Tamaño: ${element.tamano}");
    //   }
    // });

    test('Revisar Backups de un sistema', () async {
      modBackups = ModBackups();
      var curSistemas2 = await ConSistemas().obtenerSistemas();

      for (SchSistema curSistema in curSistemas2) {
        String chkheader = curSistema.backupHeaderEvaluado();
        backups2 = modBackups.obtenerBackups("${chkheader}_");

        expect(backups2, isA<List<SchBackups>>(),
            reason: "No es List<SchBackups>");
        //print("Backups: ${curSistema.Key_Sistema} - $chkheader - ${backups2.length}");

        // ignore: unused_local_variable
        for (var element in backups2) {
          //print(              "Sistema: ${element.keySistema} Fecha: ${element.fecha} Tamaño: ${element.tamano}");
        }
      }
    });

    test('Revisar Backups MAX_SN', () async {
      List<SchBackups> backups2 = [];
      modBackups = ModBackups();
      backups2 = modBackups.obtenerBackups("MAX_SN");
      expect(backups2, isA<List<SchBackups>>(),
          reason: "No es List<SchBackups>");
      expect(backups2.length, greaterThan(0), reason: "No tiene backups");
      print("Backups: ${backups2.length}");

      for (var element in backups2) {
        print(
            "Sistema: ${element.keySistema} Fecha: ${element.fecha} Tamaño: ${element.tamano}");
      }
    });
  });
}
