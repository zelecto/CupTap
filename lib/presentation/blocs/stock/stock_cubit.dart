import 'package:bloc/bloc.dart';
import 'package:cutap/domain/models/modelos.dart';
import 'package:equatable/equatable.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  StockCubit() : super(StockInitial());

  void stockChanged(int newStock, Producto producto) {
    emit(StockChanged(newStock, producto));
  }
}
