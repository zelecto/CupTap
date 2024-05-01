import 'package:cutap/entity/pedido/detalle_pedido.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'detalles_pedido_provider.g.dart';

@Riverpod(keepAlive: true)
class DetallesPedido extends _$DetallesPedido {

  @override
  List<DetallePedido> build() => [];

  void agregarDetalle(DetallePedido detallePedido){
    state = [...state, detallePedido];
  }

  void eliminarDetalle(DetallePedido detallePedido){
    state = state.where((detalle) => detalle != detallePedido).toList();
  }
}

