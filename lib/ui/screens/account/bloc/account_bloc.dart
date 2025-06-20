import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';
/// Stores the name and updates it on demand.
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState(name: 'John Smith')) {
    on<UpdateName>((event, emit) {
      emit(state.copyWith(name: event.newName));
    });
  }
}
