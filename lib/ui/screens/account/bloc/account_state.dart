part of 'account_bloc.dart';

class AccountState {
  final String name;

  const AccountState({required this.name});

  AccountState copyWith({String? name}) {
    return AccountState(
      name: name ?? this.name,
    );
  }
}
