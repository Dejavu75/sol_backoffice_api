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
      'exe_ges2k_fecha': exeGes2kFecha?.toIso8601String(),
      'exe_ges_actualizador_fecha': exeGesActualizadorFecha?.toIso8601String(),
      'exe_ges_fecha': exeGesFecha?.toIso8601String(),
      'exe_gescom_fecha': exeGescomFecha?.toIso8601String(),
      'dev_fecha': devFecha?.toIso8601String(),
      'tests_fecha': testsFecha?.toIso8601String(),
      'formularios_fecha': formulariosFecha?.toIso8601String(),
      'file': file,
    };
  }

  static SchActualizaciones fromMap(Map<String, dynamic> map) {
    return SchActualizaciones(
      version: map['version'],
      fecha: map['fecha'] != null ? DateTime.parse(map['fecha']) : null,
      descripcion: map['descripcion'],
      exeGes2kFecha: map['exe_ges2k_fecha'] != null ? DateTime.parse(map['exe_ges2k_fecha']) : null,
      exeGesActualizadorFecha: map['exe_ges_actualizador_fecha'] != null ? DateTime.parse(map['exe_ges_actualizador_fecha']) : null,
      exeGesFecha: map['exe_ges_fecha'] != null ? DateTime.parse(map['exe_ges_fecha']) : null,
      exeGescomFecha: map['exe_gescom_fecha'] != null ? DateTime.parse(map['exe_gescom_fecha']) : null,
      devFecha: map['dev_fecha'] != null ? DateTime.parse(map['dev_fecha']) : null,
      testsFecha: map['tests_fecha'] != null ? DateTime.parse(map['tests_fecha']) : null,
      formulariosFecha: map['formularios_fecha'] != null ? DateTime.parse(map['formularios_fecha']) : null,
      file: map['file'],
    );}
}
// {
//     "version": 27,
//     "fecha": "2024-04-11T13:55:43.356Z",
//     "descripcion": "ges_v27.zip",
//     "exe_ges2k_fecha": "2022-12-16T12:22:02.000Z",
//     "exe_ges_actualizador_fecha": "2024-02-05T13:06:38.000Z",
//     "exe_ges_fecha": "2024-04-09T11:54:30.000Z",
//     "exe_gescom_fecha": "2024-02-27T20:36:12.000Z",
//     "dev_fecha": "2024-03-22T18:15:52.000Z",
//     "tests_fecha": "2024-04-09T11:54:46.000Z",
//     "formularios_fecha": "2024-04-09T11:54:40.000Z",
//     "file": "/etc/nages2/gesdir/ges_v27.zip"
// }