import 'package:flutter/material.dart';
import 'package:group_app_project/model/order_model/order_model.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';
import 'package:group_app_project/theme/app_color.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColor.secondaryAppColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Order # ${order.orderId}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          EmptySpace.sizeH24,
          Row(
            // order.status 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Unknown status',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              ),
              Text(
                '${order.totalPrice}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              ),
              Text(
                order.orderDate.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
