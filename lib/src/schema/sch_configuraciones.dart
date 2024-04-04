// ignore_for_file: non_constant_identifier_names

class SchConfiguraciones {
  int conexion_actual;
  String usuario;
  String apikey;
  String url;
  String nombre;
  List<SchConexion> conexiones;

  SchConfiguraciones(
      {this.conexion_actual = 0,
      this.url = "",
      this.nombre = "",
      this.conexiones = const [],
      this.usuario = "",
      this.apikey = ""});

  factory SchConfiguraciones.fromJson(Map<String, dynamic> json) {
    List<dynamic> conexionesJson = json["conexiones"];
    List<SchConexion> conexiones = conexionesJson
        .map((conexion) => SchConexion.fromJson(conexion))
        .toList();
    SchConexion conexionactual = conexiones[json["conexion_actual"]];

    return SchConfiguraciones(
        conexion_actual: json["conexion_actual"],
        url: conexionactual.url,
        nombre: conexionactual.nombre,
        usuario: conexionactual.usuario,
        apikey: conexionactual.apikey,
        conexiones: conexiones);
  }
}

class SchConexion {
  String url;
  String nombre;
  String usuario;
  String apikey;
  SchConexion({
    required this.url,
    required this.nombre,
    required this.usuario,
    required this.apikey,
  });

  factory SchConexion.fromJson(Map<String, dynamic> json) => SchConexion(
        url: json["url"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        apikey: json["apikey"],
      );
}
