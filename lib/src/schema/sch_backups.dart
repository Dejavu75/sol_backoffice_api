      // okData: false,
      // okFile: false,
      // okNormal: false,
      // okTamano: false,
      // okGeneral: false
class SchBackups {
  String keySistema;
  DateTime? fecha;
  double? tamano;
  String? archivo;
  DateTime? fechaDatos;
  int? normalizado;
  bool? okData = false;
  bool? okFile = false;
  bool? okNormal = false;
  bool? okTamano = false;
  bool? okGeneral = false;
  bool? leido = false;
  SchBackups({
    required this.keySistema,
    this.fecha,
    this.tamano,
    this.archivo,
    this.fechaDatos,
    this.normalizado,
    this.okData,
    this.okFile,
    this.okNormal,
    this.okTamano,
    this.okGeneral,
    this.leido,
  });

  // Método para convertir un objeto SchBackups a un mapa
  Map<String, dynamic> toMap() {
    return {
      'key_sistema': keySistema,
      'fecha': fecha?.toIso8601String(),
      'tamano': tamano,
      'archivo': archivo,
      'fechaDatos': fechaDatos?.toIso8601String(),
      'normalizado': normalizado ?? '0',
      'okData': okData ?? false,
      'okFile': okFile ?? false,
      'okNormal': okNormal ?? false,
      'okTamano': okTamano ?? false,
      'okGeneral': okGeneral ?? false,
      'leido': leido ?? false,
    };
  }

  // Método para convertir un mapa a un objeto SchBackups
  static SchBackups fromMap(Map<String, dynamic> map) {
    return SchBackups(
      keySistema: map['key_sistema'],
      fecha: map['fecha'] != null ? DateTime.parse(map['fecha']) : null,
      tamano: map['tamano'] != null ? (map['tamano'] as num).toDouble() : null,
      archivo: map['archivo'],
      fechaDatos:
          map['fechaDatos'] != null ? DateTime.parse(map['fechaDatos']) : null,
      normalizado: map['normalizado'] != null ? (map['normalizado'] as int) : null,
      okData: map['okData'] ?? false,
      okFile: map['okFile'] ?? false,
      okNormal: map['okNormal'] ?? false,
      okTamano: map['okTamano'] ?? false,
      okGeneral: map['okGeneral'] ?? false,
      leido: map['leido'] ?? false,
         
    );
  }
}
