import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:group_app_project/ui/screens/cart/cart_screen.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

    List<ItemModel> items = [
    // ItemModel(name: 'Apple', quantity: 2, price: 20.23, imagePath: 'assets/cart/apples.png'),
    // ItemModel(name: 'Strawberry', quantity: 4, price: 14, imagePath: 'assets/cart/strawberry.png')
  ];

  double itemsCost = 0;
  double deliveryFee = 0;
  double totalCost = 0;

  bool isLocationDetected = false;
  bool isConfirmTheOrder = false;


  
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CartInitialEvent>(cartInitial);

    on<IncrementItemByOneEvent>(increment);

    on<DecrementItemByOneEvent>(decrement);

    on<DeleteItemEvent>(deleteItem);

    on<DetermineFinalCostEvent>(determineCost);
  }

  FutureOr<void> increment(IncrementItemByOneEvent event, Emitter<CartState> emit) {
    items[event.index].quantity += 1;
    emit(IncrementItemByOneState());
  }

  FutureOr<void> decrement(DecrementItemByOneEvent event, Emitter<CartState> emit) {
      if (items[event.index].quantity > 0) {
      items[event.index].quantity -= 1;
      emit(DecrementItemByOneState());
    }
  }

  FutureOr<void> deleteItem(DeleteItemEvent event, Emitter<CartState> emit) {
    if(items.isEmpty){
      return null;
    }

    final index = event.index;
    items.removeAt(index);

    emit(SuccessDeleteItemState());
  }

  FutureOr<void> determineCost(DetermineFinalCostEvent event, Emitter<CartState> emit) {

    itemsCost = items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
    deliveryFee = isLocationDetected ? 12 : 0;
    totalCost = itemsCost + deliveryFee;
    
    if (items.isEmpty || !isLocationDetected || itemsCost == 0) {
      isConfirmTheOrder = false;
    } else {
      isConfirmTheOrder = true;
    }

    
    

    emit(SuccessDeterminingFinalCostState());
  }

  FutureOr<void> cartInitial(CartInitialEvent event, Emitter<CartState> emit) {
     itemsCost = items.isNotEmpty? items.fold(0.0, (sum, item) => sum + (item.price * item.quantity)) : 0;
     totalCost = itemsCost;
     emit(CartInitial());
  }
}
