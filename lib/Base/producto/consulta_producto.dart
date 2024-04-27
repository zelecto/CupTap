
import 'package:cutap/entity/producto/producto.dart';
import 'package:dio/dio.dart';

class GetProducto {
  Future<List<Producto>> getAllProducts() async {
    
    final dio = Dio();
    
    var url = 'https://cuptapapi.onrender.com/v1/Productos';

    final response = await dio.get(url);
    var listaProductos = List<Producto>.from(response.data["data"].map((x) => Producto.fromJson(x)));
    return listaProductos;

  }
}
