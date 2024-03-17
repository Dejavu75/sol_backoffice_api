import 'package:sol_backoffice_api/sol_backoffice_api.dart';

void main() async {
  var modC = ModConfiguraciones();
  var curC = await modC.obtenerConfiguraciones();
  print('URL: ${curC.url}');
}
