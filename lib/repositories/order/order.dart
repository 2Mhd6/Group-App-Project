import 'package:group_app_project/model/order_model/order_model.dart';
import 'package:group_app_project/shared/setup.dart';


//Handling order-related data from the database.
class OrdersRepository {

//add New Order
  Future<void> addNewOrder({ required OrderModel order}) async {
    await SetupSupabase.sharedSupabase.client.from('orders').insert(order.toMap());//Converts the object to a map.
  }
//Fetch all orders.
  Future<List<OrderModel>> getAllOrders({required String userId }) async {

//Fetch data associated with this user.
    final result = await SetupSupabase.sharedSupabase.client.from('orders').select().eq('user_id', '15a5c743-31bc-4d52-afda-f6f25faf5bed');

    if(result.isEmpty){
      return [];
    }

    return result.map((order) => OrderModelMapper.fromMap(order)).toList();
  }
}