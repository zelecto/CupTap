import 'package:cutap/entity/pedido/venta_producto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'detalles_pedido_provider.g.dart';

@Riverpod(keepAlive: true)
class DetallesPedidoProvider extends _$DetallesPedidoProvider {

  @override
  List<DetallePedido> build() => [];

  void agregarDetalle(DetallePedido detallePedido){
    state = [...state, detallePedido];
  }

  void eliminarDetalle(DetallePedido detallePedido){
    state = state.where((detalle) => detalle != detallePedido).toList();
  }
}


