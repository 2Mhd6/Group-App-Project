import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_app_project/ui/Screen/home_screen.dart';
import 'package:group_app_project/ui/Screen/Authentication/login_screen.dart';
import 'package:group_app_project/ui/Screen/Authentication/signup_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => LoginScreen()),
        GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
        GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
