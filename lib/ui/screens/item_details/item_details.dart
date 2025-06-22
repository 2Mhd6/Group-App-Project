import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:group_app_project/model/cart.dart';
import 'package:group_app_project/model/fruit_model.dart';
import 'package:group_app_project/model/item_cart_model.dart';
import '../../../../theme/app_color.dart';
import 'bloc/quantity_bloc.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.fruit});

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final quantityBloc = context.read<QuantityBloc>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(fruit.image,
                      width: width * 0.9,
                      height: height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    fruit.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: const Text(
                    'available',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Chip(
                    label: const Text('1 kg'),
                    backgroundColor: const Color(0xfff5f5f5),
                    shape: const StadiumBorder(),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: BlocBuilder<QuantityBloc, QuantityState>(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => context.read<QuantityBloc>().add(
                                DecreaseQuantity(),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: AppColor.primaryAppColor,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '${state.quantity}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () => context.read<QuantityBloc>().add(
                                IncreaseQuantity(),
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColor.primaryAppColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.04,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<QuantityBloc, QuantityState>(
                        builder: (context, state) {
                          return Text(
                            'Total \$${state.quantity * 19}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          GetIt.I.get<Cart>().items.add(
                            ItemCartModel(
                              name: fruit.name, 
                              quantity: quantityBloc.quantity, 
                              price: 19, 
                              imagePath: 'assets/cart/${fruit.name}.png'
                            )
                          );

                          await Future.delayed(Duration(milliseconds: 500));

                          if(context.mounted){
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryAppColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.08,
                            vertical: height * 0.015,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Add Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
