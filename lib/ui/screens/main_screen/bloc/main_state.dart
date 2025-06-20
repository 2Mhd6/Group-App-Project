part of 'main_bloc.dart';


class MainState {
  final int bottomNavigationBarIndex;

  MainState({required this.bottomNavigationBarIndex,});

  MainState copyWith({int? bottomNavigationBarIndex}) => MainState(bottomNavigationBarIndex: bottomNavigationBarIndex ?? 0);

  @override
  bool operator ==(Object other) => 
  identical(this, other) ;
  
  @override
  int get hashCode => bottomNavigationBarIndex.hashCode;

}
