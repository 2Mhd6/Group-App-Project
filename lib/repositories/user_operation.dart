import 'package:group_app_project/model/user_model/user_model.dart';
import 'package:group_app_project/repositories/auth/auth.dart';
import 'package:group_app_project/shared/setup.dart';

Future<void> createUserInstance({required UserModel user}) async {
  await SetupSupabase.sharedSupabase.client.from('users').insert(user.toMap());
}


Future<void> updateUserName({required String newName, required String userId}) async {
  await SetupSupabase.sharedSupabase.client.from('users').update({'name': newName}).eq('user_id', userId);
}

Future<void> deleteUser({required String userId}) async {
  await Auth.signOut();
  await SetupSupabase.sharedSupabase.client.auth.admin.deleteUser(userId);
}