import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:group_app_project/repositories/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SetupSupabase {

  static final Supabase sharedSupabase = Supabase.instance;

  static Future<void> setUpSupabase(){
    return  Supabase.initialize(
      url: dotenv.get('url'), 
      anonKey: dotenv.get('key')
    );
  }
}


class InjectionContainer{

  static void setUp() async{
    GetIt.I.registerSingleton<UserDataModel>(UserDataModel());
  }
}