import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:group_app_project/theme/app_color.dart';
import 'package:group_app_project/ui/screens/main_screen/main_screen.dart';
import 'package:group_app_project/ui/screens/onboard/onboard_item.dart';
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
      child: _OnBoardScreenContent(),
    );
  }
}

class _OnBoardScreenContent extends HookWidget {
  _OnBoardScreenContent();
  final _duration = Duration(milliseconds: 500);
  final _pages = [
    OnBoardItem(
      image: 'assets/images/Frame1.png',
      title: 'On demand & runtime location',
      description:
          'Pickup from your location at \nyour preferred date \nand time',
    ),
    OnBoardItem(
      image: 'assets/images/Frame2.png',
      title: 'Anything, anytime \nanywhere',
      description:
          'Weather it’s a percel, a cheque or \nan important doc, we’ll percel',
    ),
    OnBoardItem(
      image: 'assets/images/Frame3.png',
      title: 'Live track \nyour shipments',
      description:
          'See a real - time view of your courier \non the map on the day of delivery',
    ),
  ];
void _nextPage(int currentIndex, PageController pageController, BuildContext context) {
    if (currentIndex < _pages.length ) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to main page
      context.go(MainScreen.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<OnboardBloc, OnboardState>(
          listener: (context, state) {
              _nextPage(state.index, pageController, context);
          },
          builder: (BuildContext context, OnboardState state) {
              final currentIndex = state.index < _pages.length ? state.index : _pages.length -1 ;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Image.asset('assets/images/text.png'),
                ),
                Expanded(
                  flex: 2,
                  child: AnimatedSwitcher(
                    duration: _duration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        _pages[currentIndex].image,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: _pages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          key: ValueKey(index),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                _pages[index].title,
                                key: ValueKey(_pages[index].title),
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 16),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                _pages[index].description,
                                key: ValueKey(_pages[index].description),
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Container(
                              height: 5.0,
                              width: 5.0,
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? AppColor.primaryAppColor
                                    : AppColor.secondaryAppColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                           context.read<OnboardBloc>().add(PageChangedEvent(newIndex: currentIndex +1));
                          },
                          child: Text(
                            currentIndex == _pages.length - 1
                                ? 'Get Started'
                                : 'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
