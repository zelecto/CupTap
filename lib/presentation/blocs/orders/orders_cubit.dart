import 'dart:typed_data';
import 'package:cutap/domain/models/modelos.dart';
import 'package:cutap/infrastructure/inputs/products/cantidad.dart';
import 'package:cutap/infrastructure/inputs/products/imagen.dart';
import 'package:cutap/infrastructure/inputs/products/precio.dart';
import 'package:cutap/utils/api/api_request.dart';
import 'package:dio/dio.dart'; // Asegúrate de importar la librería dio correcta
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cutap/infrastructure/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  void onSubmit(BuildContext context) async {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      nombre: Nombre.dirty(state.nombre.value),
      cantidad: Cantidad.dirty(state.cantidad.value),
      precio: Precio.dirty(state.precio.value),
      imagen: Imagen.dirty(state.imagen.value),
    ));

    try {
      final Producto producto = Producto(
        nombre: state.nombre.value,
        stock: int.parse(state.cantidad.value),
        precio: double.parse(state.precio.value),
        imagen: state.imagen.value,
        fechaRegistro: DateTime.now(),
        ventaActiva: true,
      );

      final bool isPosted = await _postProduct(producto);

      if (isPosted == true) {
        emit(state.copyWith(formStatus: FormStatus.created));
        if (context.mounted) context.pop();
      } else {
        emit(state.copyWith(formStatus: FormStatus.submissionFailure));
      }
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.invalid));
    }
  }

  Future<bool> deleteProduct(Producto product) async {
    final request = ApiRequest(
      data: null,
      methodType: 'delete',
      endpoint: '/Productos/${product.nombre}',
    );

    try {
      emit(state.copyWith(formStatus: FormStatus.deleting));
      final Response response = await request.request();
      emit(state.copyWith(formStatus: FormStatus.deleted));
      return response.data != null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return false;
      } else {
        rethrow;
      }
    }
  }

  Future<bool> _postProduct(Producto product) async {
    final Map<String, dynamic> productJson = product.toJson();
    final request = ApiRequest(
      methodType: 'post',
      endpoint: '/Productos',
      data: productJson,
    );

    try {
      emit(state.copyWith(formStatus: FormStatus.posting));
      final Response response = await request.request();
      print(response);
      emit(state.copyWith(formStatus: FormStatus.valid));
      return response.data != null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return false;
      } else {
        rethrow;
      }
    }
  }

  void nombreChanged(String value) {
    final nombre = Nombre.dirty(value);
    emit(state.copyWith(
      nombre: nombre,
      isValid: Formz.validate([nombre, state.nombre]),
    ));
  }

  void cantidadChanged(String value) {
    final cantidad = Cantidad.dirty(value);
    emit(state.copyWith(
      cantidad: cantidad,
      isValid: Formz.validate([cantidad, state.cantidad]),
    ));
  }

  void precioChanged(String value) {
    final precio = Precio.dirty(value);
    emit(state.copyWith(
      precio: precio,
      isValid: Formz.validate([precio, state.precio]),
    ));
  }

  void imagenChanged(Uint8List? value) {
    final imagen = Imagen.dirty(value);
    emit(state.copyWith(
      imagen: imagen,
      isValid: Formz.validate([imagen, state.precio]),
    ));
  }
}
