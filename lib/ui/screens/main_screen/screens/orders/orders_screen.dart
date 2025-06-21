import 'package:flutter/material.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';
import 'package:group_app_project/theme/app_color.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orders', style: Theme.of(context).textTheme.displayLarge),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
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
                        'Order title',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      EmptySpace.sizeH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'data',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            'data',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            'data',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
