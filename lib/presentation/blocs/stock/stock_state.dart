part of 'stock_cubit.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockChanged extends StockState {
  final Producto producto;
  final int newStock;

  StockChanged(this.newStock, this.producto);

  @override
  List<Object> get props => [newStock];
}
