import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:group_app_project/ui/screens/main_screen/main_screen.dart';
import 'package:group_app_project/ui/widgets/onboard_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'bloc/onboard_bloc.dart';

// A stateless screen that displays the first onboarding page using the OnBoardItem widget.
class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});
  static const routeName = '/onboard';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardBloc>(
      create: (context) => OnboardBloc(),
      child: const _OnBoardScreenContent(),
    );
  }
}

class _OnBoardScreenContent extends HookWidget {
  const _OnBoardScreenContent();

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Scaffold(
      body: SafeArea(
        child: BlocListener<OnboardBloc, OnboardState>(
          listener: (context, state) {
            switch (state) {
              case FirstItemState():
                break;
              case SecondItemState():
                pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                );
                break;
              case ThirdItemState():
                pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                );
                break;
              case OnBoardEndedState():
                context.go(MainScreen.routeName);
                break;
            }
          },
          child: PageView(
            controller: pageController,
            children: [
              OnBoardItem(
                image: 'assets/images/Frame1.png',
                title: 'On demand & runtime location',
                description:
                    'Pickup from your location at \nyour preferred date \nand time',
                onPressed: () {
                  context.read<OnboardBloc>().add(
                    FirstPageButtonPressedEvent(),
                  );
                },
                buttonText: 'Next',
                selectedIndex: 0,
              ),
              OnBoardItem(
                image: 'assets/images/Frame2.png',
                title: 'Anything, anytime \nanywhere',
                description:
                    'Weather it’s a percel, a cheque or \nan important doc, we’ll percel',
                onPressed: () {
                  context.read<OnboardBloc>().add(
                    SecondPageButtonPressedEvent(),
                  );
                },
                buttonText: 'Next',
                selectedIndex: 1,
              ),
              OnBoardItem(
                image: 'assets/images/Frame3.png',
                title: 'Live track \nyour shipments',
                description:
                    'See a real - time view of your courier \non the map on the day of delivery',
                onPressed: () {
                  context.read<OnboardBloc>().add(
                    ThirdPageButtonPressedEvent(),
                  );
                },
                buttonText: 'Get’s started',
                selectedIndex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
