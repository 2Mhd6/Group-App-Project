
part of 'main_bloc.dart';

sealed class MainEvent {}


class BottomNavigationBarItemSelected extends MainEvent{
  final int newIndex;

  BottomNavigationBarItemSelected({required this.newIndex});
}