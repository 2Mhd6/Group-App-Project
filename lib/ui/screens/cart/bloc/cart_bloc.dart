import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:group_app_project/model/cart.dart';
import 'package:group_app_project/model/item_cart_model.dart';
import 'package:group_app_project/model/order_model/order_model.dart';
import 'package:group_app_project/repositories/notification/notification.dart';
import 'package:group_app_project/repositories/order/order.dart';
import 'package:group_app_project/repositories/user_data_model.dart';
import 'package:group_app_project/shared/setup.dart';
import 'package:meta/meta.dart';
import 'package:postgrest/src/postgrest_builder.dart';
import 'package:postgrest/src/types.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  List<ItemCartModel> items = GetIt.I.get<Cart>().items;

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

    on<ConfirmOrder>(confirmOrder);
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

  FutureOr<void> confirmOrder(ConfirmOrder event, Emitter<CartState> emit) async{
    
    final user = GetIt.I.get<UserDataModel>().user;
    final queryNotificationId = SetupSupabase.sharedSupabase.client
        .from('users')
        .select('notification_id')
        .eq('user_id', user!.id).maybeSingle();

   try{
   // await Notification.sendPushNotification(notificationID: queryNotificationId['notification_id'] as String);

     await OrdersRepository.addNewOrder(order: event.order);

     emit(SuccessConfirmationOrder());
     
   }catch(error){
    log(error.toString());
   }

  }
}

extension on PostgrestTransformBuilder<PostgrestMap?> {
  void operator [](String other) {}
}
