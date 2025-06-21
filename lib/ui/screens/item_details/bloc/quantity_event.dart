part of 'quantity_bloc.dart';

sealed class QuantityEvent {}

class IncreaseQuantity extends QuantityEvent {}

class DecreaseQuantity extends QuantityEvent {}
