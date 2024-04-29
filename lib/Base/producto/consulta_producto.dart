import 'package:cutap/config/api/api_request.dart';
import 'package:cutap/entity/producto/producto.dart';


class ProductApiService {
  Future<List<Producto>> getAllProducts() async {
    final apiRequest = ApiRequest(
        methodType: "get",
        endpoint: "https://cuptapapi.onrender.com/v1/Productos",
        data: null
    );
    final response = await apiRequest.request();
    var listaProductos = List<Producto>.from(
        response.data["data"].map((x) => Producto.fromJson(x)));
    return listaProductos;
  }
}
