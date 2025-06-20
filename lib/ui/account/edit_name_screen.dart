import 'package:flutter/material.dart';
import '../../../theme/app_color.dart';
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
              onPressed: () {
                final name = _controller.text;
                bloc.add(UpdateName(name));
                Navigator.pop(context);
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
