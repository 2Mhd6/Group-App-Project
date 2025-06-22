import 'package:flutter_bloc/flutter_bloc.dart';

part 'quantity_event.dart';
part 'quantity_state.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {

  int quantity = 0;
  QuantityBloc() : super(QuantityState(0)) {
    on<IncreaseQuantity>((event, emit) {
      quantity += 1;
      emit(QuantityState(state.quantity + 1));
    });

    on<DecreaseQuantity>((event, emit) {
      if (state.quantity > 1) {
        quantity -= 1;
        emit(QuantityState(state.quantity - 1));
      }
    });
  }
}
