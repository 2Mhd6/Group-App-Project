import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/theme/app_color.dart';
import 'package:group_app_project/ui/screens/account/account_screen.dart';
import 'package:group_app_project/ui/screens/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:group_app_project/ui/screens/cart/cart_screen.dart';
import 'package:group_app_project/ui/screens/home/home_screen.dart';
import 'package:group_app_project/ui/screens/main_screen/screens/orders/orders_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  List<Widget> screens = [HomeScreen(), CartScreen(), OrdersScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),

      child: Builder(
        builder: (context) {

          final bottomNavBloc = context.read<BottomNavBloc>();

          return BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return Scaffold(
                      bottomNavigationBar: NavigationBar(
                        indicatorColor: Colors.transparent,
                        selectedIndex: bottomNavBloc.index,
                        onDestinationSelected: (value) {
                          bottomNavBloc.add(ChangeScreenEvent(index: value));
                        },
                        destinations: [
                          NavigationDestination(
                            icon: Icon(Icons.home),
                            selectedIcon: Icon(Icons.home,size: 25,color: AppColor.primaryAppColor,),
                            label: 'Home',
                          ),
                    
                          NavigationDestination(
                            icon: Icon(Icons.shopping_cart_outlined),
                            selectedIcon: Icon(Icons.shopping_cart_outlined,size: 25,color: AppColor.primaryAppColor,),
                            label: 'Cart',
                          ),
                    
                          NavigationDestination(
                            icon: Icon(Icons.receipt_long_outlined),
                            selectedIcon: Icon(Icons.receipt_long_outlined,size: 25,color: AppColor.primaryAppColor,),
                            label: 'Orders',
                          ),
                    
                          NavigationDestination(
                            icon: Icon(Icons.person_2_outlined),
                            selectedIcon: Icon(Icons.person_2_outlined,size: 25,color: AppColor.primaryAppColor,),
                            label: 'Account',
                          ),
                        ],
                      ),
          
                      body: screens.elementAt(bottomNavBloc.index),
                    );
            },
          );
        }
      ),
    );
  }
}
