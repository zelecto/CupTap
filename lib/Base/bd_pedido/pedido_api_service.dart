import 'dart:async';
import 'package:cutap/utils/api/api_request.dart';
import 'package:cutap/entity/pedido/pedido.dart';

class PedidoApiService {
  Future<List<Pedido>> getPedidoUser(String cedula) async {
    ApiRequest apiRequest = ApiRequest(
        methodType: "get",
        endpoint: "/Usuarios/$cedula/pedidos",
        data: null);
    try {
      final response = await apiRequest.request();
      final List<Pedido> listaPedidos = List<Pedido>.from(
          response.data["data"].map((x) => Pedido.fromJson(x)));
      return listaPedidos;  
    } catch (e) {
      print(e);
      return [];
    }
    
  }
}
