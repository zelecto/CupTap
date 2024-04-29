
import 'package:cutap/Base/producto/consulta_producto.dart';
import 'package:cutap/entity/producto/producto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'producto_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Producto>> consultaProductos (ConsultaProductosRef ref) async{
  return ProductApiService().getAllProducts();
}
