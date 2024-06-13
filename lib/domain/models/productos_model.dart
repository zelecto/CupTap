import "dart:convert";
import "package:cutap/domain/models/modelos.dart";
import "package:flutter/material.dart";

class Producto {
  final String nombre;
  final String? descripcion;
  final double precio;
  final int stock;
  final bool ventaActiva;
  final Promocion? promocion;
  final DateTime fechaRegistro;
  final dynamic imagen;

  Producto({
    required this.nombre,
    this.descripcion,
    required this.precio,
    required this.stock,
    required this.ventaActiva,
    this.promocion,
    required this.fechaRegistro,
    required this.imagen,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        stock: json["stock"],
        ventaActiva: json["venta_activa"],
        promocion: json["promocion"] != null
            ? Promocion.fromJson(json["promocion"])
            : null,
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        imagen: json["imagen"] != null
            ? MemoryImage(base64Decode(json["imagen"]))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "venta_activa": ventaActiva,
        "promocion": promocion?.toJson(),
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "imagen": imagen,
      };

  @override
  String toString() {
    return 'Producto { '
        'nombre: $nombre, '
        'descripcion: ${descripcion ?? "N/A"}, '
        'precio: $precio, '
        'stock: $stock, '
        'ventaActiva: ${ventaActiva ? "Sí" : "No"}, '
        'promocion: ${promocion != null ? promocion.toString() : "N/A"}, '
        'fechaRegistro: ${fechaRegistro.toIso8601String()}, '
        'imagen: ${imagen != null ? "Presente" : "Ausente"} '
        '}';
  }
}
