// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:group_app_project/ui/app/bloc/auth_bloc.dart';
// import 'package:group_app_project/ui/app/bloc/auth_notifier.dart';
// import 'package:group_app_project/ui/screens/login/login_screen.dart';
// import 'package:group_app_project/ui/screens/main_screen/main_screen.dart';
// import 'package:group_app_project/ui/screens/onboard/onboard_screen.dart';


// //Controlling navigation between screens
// GoRouter router(AuthBloc authBloc) => GoRouter(
//   initialLocation: OnBoardScreen.routeName,
//   refreshListenable: AuthNotifier(authBloc: authBloc),
//   routes: [
//     GoRoute(
//       path: OnBoardScreen.routeName,
//       builder: (context, state) => OnBoardScreen(),
//     ),
//     GoRoute(
//       path: MainScreen.routeName,
//       builder: (context, state) => MainScreen(),
//     ),
//     GoRoute(
//       path: LoginScreen.routeName,
//       builder: (context, state) => LoginScreen(),
//     ),
//   ],
//   redirect: (context, state) {
//     final authState = context.read<AuthBloc>().state;

//     // final isLoggingIn = state.fullPath == LoginScreen.routeName;
//     // final isOnboarding = state.fullPath == OnBoardScreen.routeName;
//     final isMain = state.fullPath == MainScreen.routeName;
//     if (authState is! Authenticated && isMain ) {
//       return LoginScreen.routeName;
//     }

//     if (authState is Authenticated) {
//       return MainScreen.routeName;
//     }

//     return null;
//   },
// );
