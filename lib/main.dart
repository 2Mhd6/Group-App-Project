import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_app_project/shared/setup.dart';
import 'package:group_app_project/ui/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await SetupSupabase.setUpSupabase();

  
  runApp(const DeliveryApp());
}

