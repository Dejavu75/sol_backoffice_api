// {
//     "version": 0,
//     "fecha": "1980-02-01T00:00:00.000Z",
//     "descripcion": "",
//     "exe_ges2k_fecha": "1980-02-01T00:00:00.000Z",
//     "exe_ges_actualizador_fecha": "1980-02-01T00:00:00.000Z",
//     "exe_ges_fecha": "1980-02-01T00:00:00.000Z",
//     "exe_gescom_fecha": "1980-02-01T00:00:00.000Z",
//     "dev_fecha": "1980-02-01T00:00:00.000Z",
//     "tests_fecha": "1980-02-01T00:00:00.000Z",
//     "formularios_fecha": "1980-02-01T00:00:00.000Z",
//     "file": ""
// }
class SchActualizaciones{
  int? version;
  DateTime? fecha;
  String? descripcion;
  DateTime? exeGes2kFecha;
  DateTime? exeGesActualizadorFecha;
  DateTime? exeGesFecha;
  DateTime? exeGescomFecha;
  DateTime? devFecha;
  DateTime? testsFecha;
  DateTime? formulariosFecha;
  String? file;

  SchActualizaciones({
    this.version,
    this.fecha,
    this.descripcion,
    this.exeGes2kFecha,
    this.exeGesActualizadorFecha,
    this.exeGesFecha,
    this.exeGescomFecha,
    this.devFecha,
    this.testsFecha,
    this.formulariosFecha,
    this.file,
  });

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'fecha': fecha?.toIso8601String(),
      'descripcion': descripcion,
      'exeGes2kFecha': exeGes2kFecha?.toIso8601String(),
      'exeGesActualizadorFecha': exeGesActualizadorFecha?.toIso8601String(),
      'exeGesFecha': exeGesFecha?.toIso8601String(),
      'exeGescomFecha': exeGescomFecha?.toIso8601String(),
      'devFecha': devFecha?.toIso8601String(),
      'testsFecha': testsFecha?.toIso8601String(),
      'formulariosFecha': formulariosFecha?.toIso8601String(),
      'file': file,
    };
  }

  static SchActualizaciones fromMap(Map<String, dynamic> map) {
    return SchActualizaciones(
      version: map['version'],
      fecha: map['fecha'] != null ? DateTime.parse(map['fecha']) : null,
      descripcion: map['descripcion'],
      exeGes2kFecha: map['exeGes2kFecha'] != null ? DateTime.parse(map['exeGes2kFecha']) : null,
      exeGesActualizadorFecha: map['exeGesActualizadorFecha'] != null ? DateTime.parse(map['exeGesActualizadorFecha']) : null,
      exeGesFecha: map['exeGesFecha'] != null ? DateTime.parse(map['exeGesFecha']) : null,
      exeGescomFecha: map['exeGescomFecha'] != null ? DateTime.parse(map['exeGescomFecha']) : null,
      devFecha: map['devFecha'] != null ? DateTime.parse(map['devFecha']) : null,
      testsFecha: map['testsFecha'] != null ? DateTime.parse(map['testsFecha']) : null,
      formulariosFecha: map['formulariosFecha'] != null ? DateTime.parse(map['formulariosFecha']) : null,
      file: map['file'],
    );}
}