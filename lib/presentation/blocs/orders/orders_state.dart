part of 'orders_cubit.dart';

enum FormStatus {
  created,
  deleting,
  deleted,
  invalid,
  valid,
  validating,
  posting,
  submissionSuccess,
  submissionFailure
}

class OrdersState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Nombre nombre;
  final Cantidad cantidad;
  final Precio precio;
  final Imagen imagen;

  const OrdersState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.nombre = const Nombre.pure(),
    this.cantidad = const Cantidad.pure(),
    this.precio = const Precio.pure(),
    this.imagen = const Imagen.pure(),
  });

  OrdersState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Nombre? nombre,
    Cantidad? cantidad,
    Precio? precio,
    Imagen? imagen,
  }) =>
      OrdersState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        nombre: nombre ?? this.nombre,
        cantidad: cantidad ?? this.cantidad,
        precio: precio ?? this.precio,
        imagen: imagen ?? this.imagen,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        nombre,
        cantidad,
        precio,
        imagen,
      ];
}
