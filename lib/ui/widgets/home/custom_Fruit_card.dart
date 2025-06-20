import 'package:flutter/material.dart';
import 'package:group_app_project/model/fruit_model.dart';
import 'package:group_app_project/theme/app_color.dart';


class CustomFruitCard extends StatelessWidget {
  final Fruit fruit;

  const CustomFruitCard({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.borderCard, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  fruit.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 130,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.whiteText,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColor.borderPrice, width: 1.5),
                  ),
                  child: Text(
                    '\$${fruit.price}',
                    style: TextStyle(
                      color: AppColor.buttonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          fruit.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColor.text,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
