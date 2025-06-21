part of 'auth_bloc.dart';

//It compares events to determine if there is a change in state.
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => []; //It compares between objects.
}

class AuthChanged extends AuthEvent{}