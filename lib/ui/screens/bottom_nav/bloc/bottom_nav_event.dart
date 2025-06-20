part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class ChangeScreenEvent extends BottomNavEvent{
  final int index;

  ChangeScreenEvent({required this.index});
}