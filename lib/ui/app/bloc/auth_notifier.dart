import 'package:flutter/foundation.dart';
import 'package:group_app_project/ui/app/bloc/auth_bloc.dart';

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
