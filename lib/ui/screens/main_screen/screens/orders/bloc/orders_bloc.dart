import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:group_app_project/model/order_model/order_model.dart';
import 'package:group_app_project/repositories/order/order.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository _ordersRepository;

  OrdersBloc({required OrdersRepository ordersRepository})
    : _ordersRepository = ordersRepository,
      super(OrdersInitial()) {
    on<LoadOrdersEvent>(_loadOrders);
  }

  Future<void> _loadOrders(
    LoadOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(OrdersLoading());
    try {
      final result = await _ordersRepository.getAllOrders(userId: '15a5c743-31bc-4d52-afda-f6f25faf5bed');
      emit(OrdersData(orders: result));
    } catch (e) {
      emit(OrdersError(message: e.toString()));
    }
  }
}
