class Order {
  final int id;
  final String title, status, price, date;

  Order({
    required this.id,
    required this.title,
    required this.status,
    required this.price,
    required this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    title: json['title'],
    status: json['status'],
    price: json['price'],
    date: json['date'],
  );
}
