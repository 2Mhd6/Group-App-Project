import 'package:group_app_project/shared/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Auth {

  static final _authSupabase = SetupSupabase.sharedSupabase;


  static Future<void> signUp({required String email, required String password}) async {
    
    await _authSupabase.client.auth.signUp(
      email:  email,
      password: password
    );
  }


    static Future<void> signIn({required String email, required String password}) async {
    
    await _authSupabase.client.auth.signInWithPassword(
      email:  email,
      password: password
    );
  }


  static User? getUserDetails() {
    final session = _authSupabase.client.auth.currentSession;
    return session?.user;
  }
}