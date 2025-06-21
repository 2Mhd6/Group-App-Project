import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(OnboardState()) {
    on<PageChangedEvent>(_pageChanged);
    
  }


  void _pageChanged(PageChangedEvent event, Emitter<OnboardState> emit){
      emit(state.copyWith(index:event.newIndex ));
  }
}
