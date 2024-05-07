class EstadoPedido {
  String nombre;

  EstadoPedido({
    required this.nombre,
  });

  factory EstadoPedido.fromJson(Map<String, dynamic> json) => EstadoPedido(
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
      };
}
