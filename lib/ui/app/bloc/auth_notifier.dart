import 'package:flutter/foundation.dart';
import 'package:group_app_project/ui/app/bloc/auth_bloc.dart';


// AuthNotifier is a ChangeNotifier that listens to the AuthBloc's state.
// When the user becomes authenticated, it notifies all listeners to update the UI.
class AuthNotifier extends ChangeNotifier {
  final AuthBloc _authBloc;

  AuthNotifier({required AuthBloc authBloc}) : _authBloc = authBloc {
    _authBloc.stream.listen((state) {
      if (state is Authenticated) {
        notifyListeners();
      }
    });
  }
}
