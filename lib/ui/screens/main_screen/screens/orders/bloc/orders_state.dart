part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();
  
  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersData extends OrdersState {
  final List<OrderModel> orders;

  const OrdersData({this.orders = const []});
}
final class OrdersError extends OrdersState {
  final String message;

  const OrdersError({required this.message});
}
