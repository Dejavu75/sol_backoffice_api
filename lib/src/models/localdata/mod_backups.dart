// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:sol_backoffice_api/src/schema/sch_backups.dart';

class ModBackupsLocal {
  List<SchBackups> obtenerBackups(
      [String? backupHeader = '*', String? keySistema = '*']) {
    List<SchBackups> backups2 = [];
    var checkdir = 'f:/Sistema/Zips/';
    var checkpath = checkdir + backupHeader!;
    final dir = Directory(checkdir);

    if (dir.existsSync()) {
      dir.listSync(followLinks: true).forEach((file) {
        if (FileSystemEntity.isFileSync(file.path) &&
            file.path.toString().startsWith(checkpath as Pattern)) {
          final File backupFile = File(file.path);

          var fecha = backupFile.lastModifiedSync();
          var tamano = backupFile.lengthSync().toDouble();
          var keysSistema = file.path.split('/').last.split('_').first;
          var fechaDatos = DateTime.now();

          // Aquí debes implementar la lógica para convertir el contenido del archivo en un objeto SchBackups
          // y añadirlo a la lista de backups. Esto dependerá de cómo estén estructurados tus archivos de backup.
          // Por ejemplo, si tus archivos de backup son JSON, podrías hacer algo como esto:

          backups2.add(SchBackups(
            keySistema: keysSistema,
            fecha: fecha,
            tamano: tamano,
            archivo: backupFile.path,
            fechaDatos: fechaDatos,
          ));
        }
      });
    }
    return backups2;
  }
}
