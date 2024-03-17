import 'package:sol_backoffice_api/src/models/mod_configuraciones.dart';
import 'package:sol_backoffice_api/src/schema/sch_configuraciones.dart';
import 'package:test/test.dart';

void main() async {
  final ModConfiguracionesBase modConfiguraciones = ModConfiguracionesBase();
  SchConfiguraciones xconf = await modConfiguraciones.obtenerConfiguraciones();
  print(xconf.url);
  prints("Salida1");
}
