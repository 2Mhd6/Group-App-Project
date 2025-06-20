// auth_event.dart
abstract class AuthEvent {}

class SignUpSubmitted extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String phone;

  SignUpSubmitted(this.username, this.email, this.password, this.phone);
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
}
