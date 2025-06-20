import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {

  int index = 0;
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeScreenEvent>(changeScreen);
  }

  FutureOr<void> changeScreen(ChangeScreenEvent event, Emitter<BottomNavState> emit) {
    index = event.index;
    emit(SuccessChangingState());
  }
}
