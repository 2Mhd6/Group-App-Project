part of 'onboard_bloc.dart';

sealed class OnboardState {}

class FirstItemState extends OnboardState {
  // Represents the content shown on the first onboarding page
  FirstItemState();
}

class SecondItemState extends OnboardState {
  // Represents the content shown on the second onboarding page
  SecondItemState();
}

class ThirdItemState extends OnboardState {
  // Represents the content shown on the third onboarding page
  ThirdItemState();
}

  // Represents the state after all pages ended
class OnBoardEndedState extends OnboardState{}