import 'package:flutter/material.dart';
import 'package:group_app_project/extensions/screen_size.dart';
import 'package:group_app_project/theme/app_color.dart';


class AppCustomButton extends StatelessWidget {
  const AppCustomButton({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
              backgroundColor: AppColor.primaryAppColor,
              foregroundColor: AppColor.secondaryAppColor,
              fixedSize: Size(context.getWidth(), 50),
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            child: Text(label),
          );
  }
}