part of 'orders_bloc.dart';

sealed class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}


class LoadOrdersEvent extends OrdersEvent{
  final String userId;

  const LoadOrdersEvent({required this.userId});
}