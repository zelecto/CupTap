import 'package:cutap/utils/api/api_request.dart';
import 'package:cutap/entity/producto/producto.dart';


class ProductApiService {
  
  Future<List<Producto>> getAllProducts() async {
    final apiRequest = ApiRequest(
        methodType: "get",
        endpoint: "/Productos",
        data: null
    );
    try {
    final response = await apiRequest.request();
    var listaProductos = List<Producto>.from(
          response.data["data"].map((x) => Producto.fromJson(x)));
      return listaProductos;
    } catch (e) {
      return[];
    }
    
  }
}

