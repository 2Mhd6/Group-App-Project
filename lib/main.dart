import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/shared/blocs/location_bloc/location_bloc.dart';
import 'package:group_app_project/ui/screens/cart/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc()..add(FetchUserLocation()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: CartScreen()),
    );
  }
}
