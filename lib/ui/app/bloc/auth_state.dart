part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthUnknown extends AuthState {}
final class Authenticated extends AuthState {}
final class UnAuthenticated extends AuthState {}


