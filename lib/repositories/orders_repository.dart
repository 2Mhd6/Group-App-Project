import 'package:group_app_project/model/order.dart';

abstract class OrdersRepositoryContract {

Future<List<Order>> getOrders();
}


