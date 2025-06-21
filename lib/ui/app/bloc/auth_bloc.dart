import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //Initial state.
  AuthBloc() : super(AuthUnknown()) {
  //A new state is emitted.
    on<AuthEvent>((event, emit) {
      if(event is AuthChanged){
        emit(Authenticated());
      }
    });
  }
}
