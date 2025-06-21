import 'package:group_app_project/repositories/auth/auth.dart';
import 'package:group_app_project/shared/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataModel {
  final User? user = Auth.getUserDetails();
}