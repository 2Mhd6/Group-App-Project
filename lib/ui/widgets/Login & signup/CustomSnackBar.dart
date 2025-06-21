import 'package:flutter/material.dart';
import 'package:group_app_project/theme/app_color.dart';


class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    final color = isSuccess ? AppColor.successSnackBar : AppColor.errorSnackBar;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message, style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        elevation: 6,
      ),
    );
  }
}
