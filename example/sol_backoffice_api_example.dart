import 'package:sol_backoffice_api/src/models/mod_sistemas.dart';

void main() async {
  var modC = ModSistemas();
  var curC = await modC.obtenerSistemas();
  print(curC);
}
