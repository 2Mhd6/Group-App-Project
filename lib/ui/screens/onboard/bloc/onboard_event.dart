part of 'onboard_bloc.dart';

sealed class OnboardEvent {}

// Event triggered when the user presses the "Next" button on the first onboarding page.
class FirstPageButtonPressedEvent extends OnboardEvent {}
// Event triggered when the user presses the "Next" button on the second onboarding page.
class SecondPageButtonPressedEvent extends OnboardEvent {}
// Event triggered when the user presses the "Get’s started" button on the third onboarding page.
class ThirdPageButtonPressedEvent extends OnboardEvent {}