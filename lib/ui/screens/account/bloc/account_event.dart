part of 'account_bloc.dart';

sealed class AccountEvent {}

class UpdateName extends AccountEvent {
  final String newName;

  UpdateName(this.newName);
}
