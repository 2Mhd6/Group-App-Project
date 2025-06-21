part of 'onboard_bloc.dart';

sealed class OnboardEvent {}

class PageChangedEvent extends OnboardEvent{
  final int newIndex;

  PageChangedEvent({required this.newIndex});
}