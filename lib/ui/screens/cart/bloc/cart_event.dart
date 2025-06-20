part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent{}

final class IncrementItemByOneEvent extends CartEvent{
  final int index; 
  final int incrementByOne = 1;

  IncrementItemByOneEvent({required this.index});
}


final class DecrementItemByOneEvent extends CartEvent {
  final int index;
  final int incrementByOne = 1;

  DecrementItemByOneEvent({required this.index});
}

final class DeleteItemEvent extends CartEvent{
  final int index; 

  DeleteItemEvent({required this.index});
}

final class DetermineFinalCostEvent extends  CartEvent{}


