import 'package:flutter/material.dart';
import 'package:group_app_project/model/item_cart_model.dart';
import 'package:group_app_project/shared/widgets/empty_space.dart';
import 'package:group_app_project/theme/app_color.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, required this.onIncrement, required this.onDecrement});

  final ItemCartModel item;
  final void Function() onIncrement;
  final void Function() onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 10,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/cart/${item.name}.png',width: 120,),
          ),

          EmptySpace.sizeW16,
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name, 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              
              Text('\$ ${item.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
              )
            ],
          ),

          Spacer(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              spacing: 18,
              children: [

                InkWell(
                  onTap: onDecrement,
                  child: Text('-', style: TextStyle(fontSize: 20),),
                ),

                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primaryAppColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text("${item.quantity}",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                ),
                
                InkWell(
                  onTap: onIncrement,
                  child: Text('+', style: TextStyle(fontSize: 20),),
                ),

              ],
            ),
          ),

          EmptySpace.sizeW16
        ],
      ),
    );
  }
}