import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/theme/app_color.dart';
import 'package:group_app_project/ui/app/bloc/auth_bloc.dart';
import 'router.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(),
    child: const _AppContent(),
  );
}

class _AppContent extends StatelessWidget {
  const _AppContent();
  @override
  Widget build(BuildContext context) {
      // get authbloc
      final AuthBloc authBloc = context.read<AuthBloc>();

    //Navigation between pages using GoRouter.
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffED6E1B)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffED6E1B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.secondaryAppColor,
          selectedItemColor: AppColor.primaryAppColor,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
        ),
        //App theme configuration using Material 3 design system and a custom seed color for consistent styling.
        useMaterial3: true,
      ),

      //Connecting the app with the "router.dart" file.
      routerConfig: router(authBloc),
    );
  }
}
