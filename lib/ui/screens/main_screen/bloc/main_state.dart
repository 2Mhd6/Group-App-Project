part of 'main_bloc.dart';


class MainState extends Equatable {
  final int bottomNavigationBarIndex;

  const MainState({required this.bottomNavigationBarIndex,});

  MainState copyWith({int? bottomNavigationBarIndex}) => MainState(bottomNavigationBarIndex: bottomNavigationBarIndex ?? 0);

  
  @override
  List<Object?> get props => [bottomNavigationBarIndex,];

}
