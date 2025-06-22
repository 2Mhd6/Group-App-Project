import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:group_app_project/repositories/auth/auth.dart';
import 'package:group_app_project/repositories/user_data_model.dart';
import 'package:group_app_project/shared/setup.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_event.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_state.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:uuid/uuid.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    // Basic validation
    if (event.username.isEmpty ||
        event.email.isEmpty ||
        event.password.isEmpty ||
        event.phone.isEmpty) {
      emit(AuthFailure("Please fill in all fields."));
      return;
    }

    if (!isValidUsername(event.username)) {
      emit(AuthFailure("Username must be at least 3 alphanumeric characters."));
      return;
    }
    if (!isValidEmail(event.email)) {
      emit(AuthFailure("Please enter a valid email address."));
      return;
    }
    if (!isValidPassword(event.password)) {
      emit(
        AuthFailure(
          "Password must be at least 6 characters with both letters and numbers.",
        ),
      );
      return;
    }
    if (!isValidPhone(event.phone)) {
      emit(AuthFailure("Phone number must be 9-15 digits."));
      return;
    }

    emit(AuthLoading());

    try {
      // Sign up user via Supabase Auth
      await Auth.signUp(email: event.email, password: event.password);

      final user = Auth.getUserDetails();
      if (user == null) {
        emit(AuthFailure("User creation failed. Try again."));
        return;
      }

      // -- Getting user info as DI
      final uuid = const Uuid().v4();
      final client = SetupSupabase.sharedSupabase.client;

      OneSignal.login(uuid);
      GetIt.I.get<UserDataModel>().user = user;
      

      await client.from('users').insert({
        'user_id': user.id,
        'name': event.username,
        'email': event.email,
        'phone': event.phone,
        'notification_id': uuid,
        'joined_date': DateTime.now().toIso8601String(),
      });

      emit(AuthSuccess("Registration successful!"));
    } catch (e) {
      emit(AuthFailure("Registration error: ${e.toString()}"));
    }
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(AuthFailure("Please enter both email and password."));
      return;
    }

    if (!isValidEmail(event.email)) {
      emit(AuthFailure("Please enter a valid email address."));
      return;
    }

    emit(AuthLoading());

    try {
      await Auth.signIn(email: event.email, password: event.password);
      emit(AuthSuccess("Login successful!"));
    } catch (e) {
      emit(AuthFailure("Login error: ${e.toString()}"));
    }
  }

  // Validators
  bool isValidEmail(String email) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  bool isValidPhone(String phone) => RegExp(r'^\d{9,15}$').hasMatch(phone);

  bool isValidPassword(String password) =>
      password.length >= 6 &&
      RegExp(r'[A-Za-z]').hasMatch(password) &&
      RegExp(r'\d').hasMatch(password);

  bool isValidUsername(String username) =>
      username.length >= 3 && RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
}
