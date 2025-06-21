part of 'onboard_bloc.dart';

class OnboardState extends Equatable{
   final int index;

   const OnboardState({ this.index = 0});

   OnboardState copyWith({int? index}) => OnboardState(index: index ?? this.index);


   @override
  List<Object?> get props => [index,];
}

