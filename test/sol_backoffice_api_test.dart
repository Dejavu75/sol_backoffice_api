import 'package:sol_backoffice_api/src/models/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/models/mod_sistemas.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_sistemas.dart';
import 'package:test/test.dart';

void main() async {
  late ModConfiguracionesBase modConfiguraciones;
  late SchConfiguraciones xconf;
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
    late ModSistemas modSistemas;
    late List<SchSistema> curSistemas;
    test('obtenerSistemas debe retornar una lista de sistemas válida',
        () async {
      modSistemas = ModSistemas();
      curSistemas = await modSistemas.obtenerSistemas(xconf);
      expect(curSistemas, isA<List<SchSistema>>(),
          reason: "No es List<SchSistemas>");
      expect(curSistemas.length, greaterThan(0), reason: "No tiene sistemas");
      print("Sisemas: ${curSistemas.length}");
    });
  });
}
