

import 'package:cutap/Base/bd_pedido/pedido_api_service.dart';
import 'package:cutap/domain/models/pedido/pedido.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedido_provider.g.dart';

@riverpod
class PedidoEstado extends _$PedidoEstado {
  @override
  List<Pedido> build() => [];

  

  void agregarPedido(Pedido pedido) {
    state = [...state, pedido];
  }
  void eliminarPedido(Pedido pedido) {
    state = state.where((detalle) => detalle != pedido).toList();
  }
  void actualizarPedido(Pedido pedido) {
    state = state.map((p) => p.id == pedido.id ? pedido : p).toList();
  }
}


@Riverpod(keepAlive: false)
Future<List<Pedido>> consultaPedido(ConsultaPedidoRef ref,String cedula) async {
  print(await PedidoApiService().getPedidoUser(cedula));
  return PedidoApiService().getPedidoUser(cedula);
}



