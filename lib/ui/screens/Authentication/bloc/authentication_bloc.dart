import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_event.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpSubmitted>((event, emit) {
      if (event.username.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty ||
          event.phone.isEmpty) {
        emit(AuthFailure("Please fill in all fields."));
      } else if (!isValidUsername(event.username)) {
        emit(AuthFailure("Invalid username."));
      } else if (!isValidEmail(event.email)) {
        emit(AuthFailure("Invalid email address."));
      } else if (!isValidPassword(event.password)) {
        emit(
          AuthFailure(
            "Password must be at least 6 characters, include letters and numbers.",
          ),
        );
      } else if (!isValidPhone(event.phone)) {
        emit(
          AuthFailure("Invalid phone number. Only digits, 9–15 characters."),
        );
      } else {
        emit(AuthSuccess("Signed up successfully."));
      }
    });

    on<LoginSubmitted>((event, emit) {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(AuthFailure("Email and password are required."));
      } else if (!isValidEmail(event.email)) {
        emit(AuthFailure("Invalid Email."));
      } else if (!isValidPassword(event.password)) {
        emit(AuthFailure("Invalid password format."));
      } else {
        emit(AuthSuccess("Logged in successfully."));
      }
    });
  }
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^\d{9,15}$');
    return phoneRegex.hasMatch(phone);
  }

  bool isValidPassword(String password) {
    final passRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
    return passRegex.hasMatch(password);
  }

  bool isValidUsername(String username) {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9]{3,}$');
    return usernameRegex.hasMatch(username);
  }
}
