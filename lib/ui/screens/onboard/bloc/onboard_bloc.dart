import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(FirstItemState()) {
    on<FirstPageButtonPressedEvent>((event, emit) {
      emit(SecondItemState());
    });
    on<SecondPageButtonPressedEvent>((event, emit) {
      emit(ThirdItemState());
    });
    on<ThirdPageButtonPressedEvent>((event, emit) {
            emit(OnBoardEndedState());

    });
  }
}
