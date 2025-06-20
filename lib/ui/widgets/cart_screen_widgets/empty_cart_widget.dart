import 'package:flutter/material.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';


class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 91
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cart/cart.png'),

            EmptySpace.sizeH32,

            Text(
              'Your Cart is empty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff4A6572)
              ),
            )
          ],
        ),
      ),
    );
  }
}