part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class IncrementItemByOneState extends CartState{}

final class DecrementItemByOneState extends CartState {}

final class SuccessDeleteItemState extends CartState{}

final class SuccessDeterminingFinalCostState extends CartState{}

final class SuccessConfirmationOrder extends CartState{}


