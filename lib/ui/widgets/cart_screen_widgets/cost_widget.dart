import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  const CostWidget({super.key, required this.label, required this.cost});

  final String label;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),

        Text('\$$cost', style: TextStyle(fontWeight: FontWeight.w800)),
      ],
    );
  }
}
