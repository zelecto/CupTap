
import 'dart:async';
import 'package:cutap/config/api/api_request.dart';
import 'package:cutap/entity/pedido/pedido.dart';
class PedidoApiService{

Future<bool> postPedido(Pedido pedido) async {
    ApiRequest apiRequest = ApiRequest(
      methodType: "post",
      endpoint: "https://cuptapapi.onrender.com/v1/Pedidos",
      data: pedido.toJson(),
    );
    print(pedido.toJson());

    final response = await apiRequest.request(); // Esperar la respuesta de la solicitud HTTP

    // Verificar si la solicitud fue exitosa y retornar un booleano correspondiente
    if (response.statusCode == 200) {
      return response.data["success"] ??false; // Retornar true si "success" es true, de lo contrario, false
    } else {
      return false; // Retornar false si la solicitud no fue exitosa
    }
  }
}