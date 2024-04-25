import 'package:cutap/entity/pedido/estado.dart';
import 'package:cutap/entity/pedido/pedido.dart';
import 'package:cutap/entity/pedido/venta_producto.dart';
import 'package:cutap/entity/producto/producto.dart';

// Crear una lista independiente de ventas de productos
List<VentaProducto> listaVentasProductos = [
  VentaProducto(
    cantidaVendida: 2,
    subPrecioCobro: 3000, // Suponiendo que el subtotal es $3000
    producto: Producto(
      nombre: 'Tinto',
      descripcion: 'Café negro típico colombiano',
      precio: 1500,
      stock: 50,
      imgUrl:
          'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
          ventaActiva: true
    ),
  ),
  VentaProducto(
    cantidaVendida: 1,
    subPrecioCobro: 2500, // Suponiendo que el subtotal es $2500
    producto: Producto(
      nombre: 'Café con Leche',
      descripcion: 'Café con leche caliente',
      precio: 2500,
      stock: 40,
      imgUrl:
          'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
          ventaActiva: true
    ),
  ),
  // Puedes agregar más ventas de productos si es necesario
];

// Crear una lista de pedidos utilizando las ventas de productos
List<Pedido> listaPedidosPrueba = [
  Pedido(
    id: 1,
    fechaRegistro: DateTime(2024, 4, 20),
    estadoPedido: estadoPedidoPendiete,
    ventaProducto: listaVentasProductos,
    total: calcularTotal(listaVentasProductos),
    
  ),
  Pedido(
    id: 2,
    fechaRegistro: DateTime(2024, 4, 21),
    estadoPedido: estadoPedidoPagado,
    ventaProducto: listaVentasProductos,
    total: 0, 
  ),
  Pedido(
    id: 3,
    fechaRegistro: DateTime(2024, 4, 22),
    estadoPedido: estadoPedidoPagado,
    ventaProducto: listaVentasProductos,
    total: 0, 
  ),
];

EstadoPedido estadoPedidoPendiete= 
EstadoPedido(nombre: "Pediente", fecha: DateTime(2024, 4, 21));

EstadoPedido estadoPedidoPagado= EstadoPedido(nombre: "Pagado", fecha: DateTime(2024, 4, 21));


// Función para calcular el total basado en las ventas de productos
double calcularTotal(List<VentaProducto> ventas) {
  double total = 0;
  for (var venta in ventas) {
    total += venta.subPrecioCobro;
  }
  return total;
}


List<Map<String, dynamic>> productos = [
  {
    'nombre': 'Café Negro',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000, // En pesos colombianos
    'cantidadVenta': 10,
    'subtotal': 20000,
  },
  {
    'nombre': 'Café con Leche',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2500,
    'cantidadVenta': 8,
    'subtotal': 20000,
  },
  {
    'nombre': 'Pan de Queso',
    'imgUrl':
        'https://assets.elgourmet.com/wp-content/uploads/2023/10/shutterstock_1758025376-1-1024x683.jpg.webp',
    'precio': 1500,
    'cantidadVenta': 15,
    'subtotal': 22500,
  },
  {
    'nombre': 'Avena con Pasas',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 3000,
    'cantidadVenta': 5,
    'subtotal': 15000,
  },
  {
    'nombre': 'Empanada',
    'imgUrl':
        'https://www.portafolio.co/files/article_new_multimedia/uploads/2021/11/20/6199a09028f1d.jpeg',
    'precio': 2000,
    'cantidadVenta': 12,
    'subtotal': 24000,
  },
];
