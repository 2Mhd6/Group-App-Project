import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState>{
  MainBloc():super(MainState(bottomNavigationBarIndex: 3)){
    on<BottomNavigationBarItemSelected>(_bottomNavigationBarItemSelected);
  }



  void _bottomNavigationBarItemSelected(BottomNavigationBarItemSelected event, Emitter<MainState> emit){
        final index = state.bottomNavigationBarIndex;
        final newIndex = event.newIndex;
        if(newIndex != index){
          emit(state.copyWith(
            bottomNavigationBarIndex: newIndex,
          ),);
        }
  }
}