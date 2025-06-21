import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/repositories/order/order.dart';
import 'package:group_app_project/ui/screens/main_screen/screens/orders/bloc/orders_bloc.dart';
import 'package:group_app_project/ui/screens/main_screen/screens/orders/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<OrdersBloc>(
    // TODO Add the real userId
    create: (context) {
      final userId = '15a5c743-31bc-4d52-afda-f6f25faf5bed';
      return OrdersBloc(ordersRepository: context.read<OrdersRepository>())
          ..add(LoadOrdersEvent(userId: userId));
    },
    child: _OrdersScreenContent(),
  );
}

class _OrdersScreenContent extends StatelessWidget {
  const _OrdersScreenContent();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orders', style: Theme.of(context).textTheme.displayLarge),
          BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              return Expanded(
                child: switch (state) {
                  OrdersInitial() => Container(),

                  OrdersLoading() => Center(child: CircularProgressIndicator()),

                  OrdersData(:final orders) =>
                  //If empty, displays an empty message.
                    orders.isEmpty
                        ? Center(child: Text('Empty Orders'))
                        : ListView.separated(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              final order = orders[index];
                              //If there are orders, displays them in a list.
                              return OrderItemView(order: order);
                            },
                            separatorBuilder: (context, index) => Divider(),
                          ),

                          //If there is an error, displays the error message.
                  OrdersError(:final message) => Center(
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
