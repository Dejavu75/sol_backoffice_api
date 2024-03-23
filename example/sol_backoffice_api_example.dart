import 'package:sol_backoffice_api/src/models/nages_api/mod_sistemas.dart';

void main() async {
  var modC = ModSistemas();
  var curC = await modC.obtenerSistemas();
  print(curC);
}
