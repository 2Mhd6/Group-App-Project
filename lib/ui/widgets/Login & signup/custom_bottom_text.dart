import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomText extends StatelessWidget {
  final String question;
  final String actionText;
  final String route;
  final Color questionColor;
  final Color actionColor;

  const CustomBottomText({
    super.key,
    required this.question,
    required this.actionText,
    required this.route,
    required this.questionColor,
    required this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(color: questionColor),
        ),
        GestureDetector(
          onTap: () {
            context.go(route);
          },
          child: Text(
            actionText,
            style: TextStyle(
              color: actionColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
