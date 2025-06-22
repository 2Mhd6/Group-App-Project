import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_app_project/shared/blocs/location_bloc/location_bloc.dart';
import 'package:group_app_project/shared/setup.dart';
import 'package:group_app_project/ui/screens/Authentication/signup_screen.dart';
import 'package:group_app_project/ui/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:group_app_project/ui/screens/onboard/onboard_screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await SetupSupabase.setUpSupabase();

  InjectionContainer.setUp();

  SetUpNotification.setUp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc()..add(FetchUserLocation()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: OnBoardScreen()
      ),
    );
  }
}
