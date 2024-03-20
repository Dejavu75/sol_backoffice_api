// {
// ignore_for_file: non_constant_identifier_names

class SchSistema {
  String Key_Sistema;
  String? ID_Sistema;
  String? Nombre;
  String? IP_Publico;
  String? exe_ges_FECHA;
  String? EXE_GES2K_FECHA;
  int? version_system;
  String? Fecha;
  String? Subsistema;
  String? Rama;
  int? localizacion;
  int? Dev_Env;
  String? url;
  int? lic_est;
  String? lic_val;
  String? lic_tlk;
  int? Comandos;
  int? IIBB;
  String? EXE_GES_Act_Fecha;
  int? DesdeGESTask;
  String? Desde_GESTask_Fecha;
  int? AGES;
  int? nages;

  SchSistema({
    required this.Key_Sistema,
    this.ID_Sistema,
    this.Nombre,
    this.IP_Publico,
    this.exe_ges_FECHA,
    this.EXE_GES2K_FECHA,
    this.version_system,
    this.Fecha,
    this.Subsistema,
    this.Rama,
    this.localizacion,
    this.Dev_Env,
    this.url,
    this.lic_est,
    this.lic_val,
    this.lic_tlk,
    this.Comandos,
    this.IIBB,
    this.EXE_GES_Act_Fecha,
    this.DesdeGESTask,
    this.Desde_GESTask_Fecha,
    this.AGES,
    this.nages,
  });

  factory SchSistema.fromJson(Map<String, dynamic> json) {
    return SchSistema(
      Key_Sistema: json['Key_Sistema'],
      ID_Sistema: json['ID_Sistema'],
      Nombre: json['Nombre'],
      IP_Publico: json['IP_Publico'],
      exe_ges_FECHA: json['exe_ges_FECHA'],
      EXE_GES2K_FECHA: json['EXE_GES2K_FECHA'],
      version_system: json['version_system'],
      Fecha: json['Fecha'],
      Subsistema: json['Subsistema'],
      Rama: json['Rama'],
      localizacion: json['localizacion'],
      Dev_Env: json['Dev_Env'],
      url: json['url'],
      lic_est: json['lic_est'],
      lic_val: json['lic_val'],
      lic_tlk: json['lic_tlk'],
      Comandos: json['Comandos'],
      IIBB: json['IIBB'],
      EXE_GES_Act_Fecha: json['EXE_GES_Act_Fecha'],
      DesdeGESTask: json['DesdeGESTask'],
      Desde_GESTask_Fecha: json['Desde_GESTask_Fecha'],
      AGES: json['AGES'],
      nages: json['nages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Key_Sistema': Key_Sistema,
      'ID_Sistema': ID_Sistema,
      'Nombre': Nombre,
      'IP_Publico': IP_Publico,
      'exe_ges_FECHA': exe_ges_FECHA,
      'EXE_GES2K_FECHA': EXE_GES2K_FECHA,
      'version_system': version_system,
      'Fecha': Fecha,
      'Subsistema': Subsistema,
      'Rama': Rama,
      'localizacion': localizacion,
      'Dev_Env': Dev_Env,
      'url': url,
      'lic_est': lic_est,
      'lic_val': lic_val,
      'lic_tlk': lic_tlk,
      'Comandos': Comandos,
      'IIBB': IIBB,
      'EXE_GES_Act_Fecha': EXE_GES_Act_Fecha,
      'DesdeGESTask': DesdeGESTask,
      'Desde_GESTask_Fecha': Desde_GESTask_Fecha,
      'AGES': AGES,
      'nages': nages,
    };
  }
}

class Directorios {
  String dir_inst = "";
  String dir_local = "";
  String dir_sistema = "";
  String dir_tablas = "";
}
