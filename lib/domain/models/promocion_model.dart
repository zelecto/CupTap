class Promocion {
    final int id;
    final String nombre;
    final String descripcion;
    final DateTime fechaInicio;
    final DateTime fechaFin;
    final int descuento;
    final DateTime fechaRegistro;

    Promocion({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.fechaInicio,
        required this.fechaFin,
        required this.descuento,
        required this.fechaRegistro,
    });

    factory Promocion.fromJson(Map<String, dynamic> json) => Promocion(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        descuento: json["descuento"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "descuento": descuento,
        "fechaRegistro": fechaRegistro.toIso8601String(),
    };
}