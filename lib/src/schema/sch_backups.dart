class SchBackups {
  String keySistema;
  DateTime? fecha;
  double? tamano;
  String? archivo;
  DateTime? fechaDatos;

  SchBackups({
    required this.keySistema,
    this.fecha,
    this.tamano,
    this.archivo,
    this.fechaDatos,
  });

  // Método para convertir un objeto SchBackups a un mapa
  Map<String, dynamic> toMap() {
    return {
      'keySistema': keySistema,
      'fecha': fecha,
      'tamano': tamano,
      'archivo': archivo,
      'fechaDatos': fechaDatos,
    };
  }

  // Método para convertir un mapa a un objeto SchBackups
  static SchBackups fromMap(Map<String, dynamic> map) {
    return SchBackups(
      keySistema: map['keySistema'],
      fecha: map['fecha'],
      tamano: map['tamano'],
      archivo: map['archivo'],
      fechaDatos: map['fechaDatos'],
    );
  }
}
