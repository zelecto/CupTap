import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
  String nombre;
  String? descripcion;
  double precio;
  int stock;
  bool ventaActiva;
  String? imgUrl;

  Producto(
      {required this.nombre,
      this.descripcion,
      required this.precio,
      required this.stock,
      required this.ventaActiva,
      this.imgUrl = "No hay imagen"});

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"]?.toDouble(),
        stock: json["stock"],
        ventaActiva: json["venta_activa"],
        imgUrl: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "venta_activa": ventaActiva,
        "imagen": imgUrl,
    };
    Map<String, dynamic> toJsonPedido() => {
        "nombre": nombre,
      };
}