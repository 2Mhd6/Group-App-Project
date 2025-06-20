import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:group_app_project/ui/screens/main_screen/bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = '/main';

  @override
  Widget build(BuildContext context) => BlocProvider<MainBloc>(
    create: (context) => MainBloc(),
    child: const _MainScreenContent(),
  );
}

class _MainScreenContent extends HookWidget {
  const _MainScreenContent();
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          pageController.animateToPage(state.bottomNavigationBarIndex, duration: Duration(milliseconds: 500), curve: Curves.bounceIn,);
        },
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
        
          children: [
            Center(child: Text('Home')),
            Center(child: Text('Cart')),
            Center(child: Text('Account')),
            Center(child: Text('Orders')),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.bottomNavigationBarIndex,
            onTap: (newIndex) {
              context.read<MainBloc>().add(
                BottomNavigationBarItemSelected(newIndex: newIndex),
              );
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'Orders',
              ),
            ],
          );
        },
      ),
    );
  }
}
