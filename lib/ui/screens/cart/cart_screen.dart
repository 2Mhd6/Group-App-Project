import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/shared/widgets/app_custom_button.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';
import 'package:group_app_project/theme/app_color.dart';
import 'package:group_app_project/shared/blocs/location_bloc/location_bloc.dart';
import 'package:group_app_project/ui/screens/cart/bloc/cart_bloc.dart';
import 'package:group_app_project/ui/screens/map/map_screen.dart';
import 'package:group_app_project/ui/widgets/cart_screen_widgets/confirmation_dialog.dart';
import 'package:group_app_project/ui/widgets/cart_screen_widgets/cost_widget.dart';
import 'package:group_app_project/ui/widgets/cart_screen_widgets/empty_cart_widget.dart';
import 'package:group_app_project/ui/widgets/cart_screen_widgets/item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();

    return BlocProvider(
      create: (context) => CartBloc()..add(CartInitialEvent()),
      child: Builder(
        builder: (context) {
          final cartBloc = context.read<CartBloc>();
          return BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is FailedToGetPermission) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is SuccessGetReadableUserLocation) {
                cartBloc.add(DetermineFinalCostEvent());
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text('My cart', style: TextStyle(color: Colors.white)),
                centerTitle: false,
                backgroundColor: AppColor.primaryAppColor,
              ),
              body: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {

                  if(cartBloc.items.isEmpty){
                    return EmptyCartWidget();
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        EmptySpace.sizeH24,

                        // List items
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: cartBloc.items.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: ValueKey(cartBloc.items[index].name),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    alignment: Alignment.centerRight,
                                    color: Colors.red,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onDismissed: (direction) {
                                    cartBloc.add(DeleteItemEvent(index: index));
                                    cartBloc.add(DetermineFinalCostEvent());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 24),
                                    child: ItemWidget(
                                      item: cartBloc.items[index],
                                      onDecrement: () {
                                        cartBloc.add(
                                          DecrementItemByOneEvent(index: index),
                                        );
                                        cartBloc.add(DetermineFinalCostEvent());
                                      },
                                      onIncrement: () {
                                        cartBloc.add(
                                          IncrementItemByOneEvent(index: index),
                                        );
                                        cartBloc.add(DetermineFinalCostEvent());
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        // To go to map screen
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              locationBloc.add(FetchUserLocation());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                    userLocation:
                                        locationBloc.currentUserLocation,
                                  ),
                                ),
                              );
                            },
                            child: BlocBuilder<LocationBloc, LocationState>(
                              builder: (context, state) {
                                if (state is SuccessGetReadableUserLocation) {
                                  return Text(
                                    '${locationBloc.countryName}, ${locationBloc.streetName}, ${locationBloc.postalCode}',
                                  );
                                }
                                return Text(
                                  'Where is your location?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        Spacer(),
                        Spacer(),
                        Spacer(),

                        // Determine final cost
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                CostWidget(
                                  label: 'Items cost',
                                  cost: cartBloc.itemsCost.toStringAsFixed(2),
                                ),

                                EmptySpace.sizeH8,

                                CostWidget(
                                  label: 'Delivery Fee',
                                  cost: cartBloc.deliveryFee.toStringAsFixed(2),
                                ),

                                EmptySpace.sizeH8,

                                Divider(),

                                CostWidget(
                                  label: 'Total cost',
                                  cost: cartBloc.totalCost.toStringAsFixed(2),
                                ),
                              ],
                            );
                          },
                        ),

                        Spacer(),

                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return AppCustomButton(
                              label: 'Checkout',
                              onPressed: cartBloc.isConfirmTheOrder
                                  ? () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ConfirmationDialog();
                                        },
                                      );
                                    }
                                  : null,
                            );
                          },
                        ),

                        Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---- For Testing Purpose ----
class ItemModel {
  ItemModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });

  final String name;
  int quantity;
  final double price;
  final String imagePath;
}
