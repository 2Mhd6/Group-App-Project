import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:group_app_project/model/fruit_model.dart';
import 'package:group_app_project/theme/app_color.dart';

import 'package:group_app_project/ui/widgets/home/custom_Fruit_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Fruit> fruits = [
      Fruit(image: 'assets/home/cherry.png', name: 'Cherries', price: 19),
      Fruit(image: 'assets/home/strawberry.png', name: 'Strawberries', price: 19),
      Fruit(image: 'assets/home/apple.png', name: 'Apples', price: 19),
      Fruit(image: 'assets/home/orange.png', name: 'Oranges', price: 19),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Column(
          children: [
            Container(height: 24, color: AppColor.background),
            Container(
              height: 56,
              width: double.infinity,
              color: AppColor.buttonColor,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: AppColor.whiteText),
                    onPressed: () {
                      context.go("/login");
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: AppColor.whiteText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fruits",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.builder(
                        itemCount: fruits.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.95,
                            ),
                        itemBuilder: (context, index) {
                          return CustomFruitCard(fruit: fruits[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
