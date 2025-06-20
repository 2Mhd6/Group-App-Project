import 'package:flutter/material.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';
import 'package:group_app_project/theme/app_color.dart';

class OnBoardItem extends StatelessWidget {
  const OnBoardItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.buttonText,
    required this.selectedIndex,
  });

  final String image;
  final String title;
  final String description;
  final VoidCallback? onPressed;
  final String buttonText;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/text.png'),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        ),

        EmptySpace.sizeH24,
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        EmptySpace.sizeH24,
        Center(
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        EmptySpace.sizeH24,
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3
              , (index) => Container(
                height: 5.0,
                width: 5.0,
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedIndex == index? AppColor.primaryAppColor : AppColor.secondaryAppColor,
                ),
              ),),
          ),
        ),
        EmptySpace.sizeH24,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
        ),
      ],
    );
  }
}