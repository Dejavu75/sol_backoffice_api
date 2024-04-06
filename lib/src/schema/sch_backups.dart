import 'dart:ffi';

class SchBackups {
  String keySistema;
  DateTime? fecha;
  double? tamano;
  String? archivo;
  DateTime? fechaDatos;
  Int? normalizado;

  SchBackups({
    required this.keySistema,
    this.fecha,
    this.tamano,
    this.archivo,
    this.fechaDatos,
    this.normalizado,
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
      normalizado: map['normalizado'] != null ? (map['normalizado'] as Int) : null,
          
    );
  }
}
