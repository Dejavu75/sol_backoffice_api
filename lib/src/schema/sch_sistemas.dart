// {
// ignore_for_file: non_constant_identifier_names

import 'package:sol_backoffice_api/src/schema/sch_backups.dart';

class SchSistema {
  String key_sistema;
  String? id_sistema;
  String? nombre;
  String? ip_publico;
  String? exe_ges_fecha;
  String? exe_ges2k_fecha;
  int? version_system;
  String? fecha;
  String? subsistema;
  String? rama;
  int? localizacion;
  int? dev_env;
  String? url;
  int? lic_est;
  String? lic_val;
  String? lic_tlk;
  int? comandos;
  int? iibb;
  String? exe_ges_act_fecha;
  int? desdegestask;
  String? desde_gestask_fecha;
  int? ages;
  int? nages;
  String? backupheader;
  List<SchBackups>? backups=[];
  SchSistema(
      {required this.key_sistema,
      this.id_sistema,
      this.nombre,
      this.ip_publico,
      this.exe_ges_fecha,
      this.exe_ges2k_fecha,
      this.version_system,
      this.fecha,
      this.subsistema,
      this.rama,
      this.localizacion,
      this.dev_env,
      this.url,
      this.lic_est,
      this.lic_val,
      this.lic_tlk,
      this.comandos,
      this.iibb,
      this.exe_ges_act_fecha,
      this.desdegestask,
      this.desde_gestask_fecha,
      this.ages,
      this.nages,
      this.backupheader});

  factory SchSistema.fromMap(Map<String, dynamic> map) {
    return SchSistema(
        key_sistema: map['key_sistema'],
        id_sistema: map['id_sistema'],
        nombre: map['nombre'],
        ip_publico: map['ip_publico'],
        exe_ges_fecha: map['exe_ges_fecha'],
        exe_ges2k_fecha: map['exe_ges2k_fecha'],
        version_system: map['version_system'],
        fecha: map['fecha'],
        subsistema: map['subsistema'],
        rama: map['rama'],
        localizacion: map['localizacion'],
        dev_env: map['dev_env'],
        url: map['url'],
        lic_est: map['lic_est'],
        lic_val: map['lic_val'],
        lic_tlk: map['lic_tlk'],
        comandos: map['comandos'],
        iibb: map['iibb'],
        exe_ges_act_fecha: map['exe_ges_act_fecha'],
        desdegestask: map['desdegestask'],
        desde_gestask_fecha: map['desde_gestask_fecha'],
        ages: map['ages'],
        nages: map['nages'],
        backupheader: map['backupheader']);
  }

  Map<String, dynamic> toMap() {
    return {
      'key_sistema': key_sistema,
      'id_sistema': id_sistema,
      'nombre': nombre,
      'ip_publico': ip_publico,
      'exe_ges_fecha': exe_ges_fecha,
      'exe_ges2k_fecha': exe_ges2k_fecha,
      'version_system': version_system,
      'fecha': fecha,
      'subsistema': subsistema,
      'rama': rama,
      'localizacion': localizacion,
      'dev_env': dev_env,
      'url': url,
      'lic_est': lic_est,
      'lic_val': lic_val,
      'lic_tlk': lic_tlk,
      'Comandos': comandos,
      'IIBB': iibb,
      'exe_ges_act_fecha': exe_ges_act_fecha,
      'desdegestask': desdegestask,
      'desde_gestask_fecha': desde_gestask_fecha,
      'ages': ages,
      'nages': nages,
      'backupheader': backupheader
    };
  }

  String backupHeaderEvaluado() {
    if (backupheader != null) {
      return backupheader!;
    } else {
      if (id_sistema != null) {
        return id_sistema!;
      } else {
        return key_sistema;
      }
    }
  }
}

class Directorios {
  String dir_inst = "";
  String dir_local = "";
  String dir_sistema = "";
  String dir_tablas = "";
}
