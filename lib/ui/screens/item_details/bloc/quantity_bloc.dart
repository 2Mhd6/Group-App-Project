import 'package:flutter_bloc/flutter_bloc.dart';

part 'quantity_event.dart';
part 'quantity_state.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc() : super(QuantityState(3)) {
    on<IncreaseQuantity>((event, emit) {
      emit(QuantityState(state.quantity + 1));
    });

    on<DecreaseQuantity>((event, emit) {
      if (state.quantity > 1) {
        emit(QuantityState(state.quantity - 1));
      }
    });
  }
}
