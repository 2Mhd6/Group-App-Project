import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/screens/splash/splash_screen.dart';
import 'UI/screens/item_details/item_details.dart';
import 'UI/screens/account/account_screen.dart';
import 'UI/screens/account/bloc/account_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodPrime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),

      home: BlocProvider(
        create: (_) => AccountBloc(),
        child: const AccountScreen(),
      ),

      routes: {
        // '/': (context) => const SplashScreen(),
        '/item': (context) => const ItemDetailsScreen(),
        // '/account': (context) => const AccountScreen(),
      },
    );
  }
}
