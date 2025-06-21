import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../theme/app_color.dart';
import 'bloc/account_bloc.dart';

class EditNameScreen extends StatelessWidget {
  final AccountBloc bloc;

  EditNameScreen({super.key, required this.bloc});

  final TextEditingController _controller = TextEditingController(
    text: 'John Smith',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 260,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryAppColor, width: 1.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final supabase = GetIt.instance<SupabaseClient>();
                final user = supabase.auth.currentUser;
                final name = _controller.text.trim();

                if (user != null && name.isNotEmpty) {
                  try {
                    await supabase
                        .from('users')
                        .update({'name': name})
                        .eq('id', user.id);

                    bloc.add(UpdateName(name));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name updated successfully'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update name: $e')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryAppColor,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
