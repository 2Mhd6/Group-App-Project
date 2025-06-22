import 'package:group_app_project/model/order_model/order_model.dart';
import 'package:group_app_project/shared/setup.dart';

class Order {

  static Future<void> addNewOrder({ required OrderModel order}) async {
    print('---');
    final response = await SetupSupabase.sharedSupabase.client.from('orders').insert(order.toMap());

    
  }

  static Future<List<OrderModel>> getAllOrders({required String userId }) async {

    final result = await SetupSupabase.sharedSupabase.client.from('orders').select().eq('user_id', userId);

    if(result.isEmpty){
      return [];
    }

    return result.map((order) => OrderModelMapper.fromMap(order)).toList();
  }
}