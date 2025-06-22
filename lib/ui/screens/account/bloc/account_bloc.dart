import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:group_app_project/repositories/user_data_model.dart';
import 'package:group_app_project/repositories/user_operation.dart';

part 'account_event.dart';
part 'account_state.dart';
/// Stores the name and updates it on demand.
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState(name: 'John Smith')) {
    on<UpdateName>((event, emit) {
      try{
        final user = GetIt.I.get<UserDataModel>();
        updateUserName(newName: event.newName, userId: user.user!.id);
        emit(AccountState(name: event.newName));
      }catch(e){
        print(e.toString());
      }
    });
  }
}
