import 'package:flutter/material.dart';
import 'package:group_app_project/extensions/screen_size.dart';
import 'package:group_app_project/shared/widgets/app_custom_button.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmptySpace.sizeH32,

          Image.asset('assets/cart/done.png'),

          EmptySpace.sizeH24,

          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: context.getWidth(multiplied: 0.7),
            ),
            child: Text('Your order is successfully placed.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),

          EmptySpace.sizeH104,

          AppCustomButton(
            label: 'BACK TO HOME',
            onPressed: () async {
              await Future.delayed(Duration(milliseconds: 400));
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}