

import 'dart:async';

import 'package:cutap/config/api/api_request.dart';

class PedidoApiService{

  Future<String> postPedido (Map<String, dynamic> json) async{
    ApiRequest apiRequest =ApiRequest(
      methodType: "post", endpoint: "https://cuptapapi.onrender.com/v1/Pedidos",
      data: json);
    final String request = apiRequest.request() as String;
    return request;
  }
}