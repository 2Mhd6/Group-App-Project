import 'package:flutter/material.dart';

class CustomBottomText extends StatelessWidget {
  final String question;
  final String actionText;
  final Widget screen;
  final Color questionColor;
  final Color actionColor;

  const CustomBottomText({
    super.key,
    required this.question,
    required this.actionText,
    required this.screen,
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
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
