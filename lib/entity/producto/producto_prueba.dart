// To parse this JSON data, do
//
//     final productoPrueba = productoPruebaFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

ProductoPrueba productoPruebaFromJson(String str) =>
    ProductoPrueba.fromJson(json.decode(str));

String productoPruebaToJson(ProductoPrueba data) => json.encode(data.toJson());

class ProductoPrueba {
  List<Datum> data;
  bool success;

  ProductoPrueba({
    required this.data,
    required this.success,
  });

  factory ProductoPrueba.fromJson(Map<String, dynamic> json) => ProductoPrueba(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}

class Datum {
  String nombre;
  String? descripcion;
  double precio;
  int stock;
  bool ventaActiva;
  List<dynamic> productosCombos;
  dynamic promocion;
  DateTime fechaRegistro;
  dynamic imagen;

  Datum({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.ventaActiva,
    required this.productosCombos,
    required this.promocion,
    required this.fechaRegistro,
    required this.imagen,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"] ,
        stock: json["stock"],
        ventaActiva: json["venta_activa"],
        productosCombos:
            List<dynamic>.from(json["productosCombos"].map((x) => x)),
        promocion: json["promocion"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "venta_activa": ventaActiva,
        "productosCombos": List<dynamic>.from(productosCombos.map((x) => x)),
        "promocion": promocion,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "imagen": imagen,
      };
}
