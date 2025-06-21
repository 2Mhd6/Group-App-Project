class ItemCartModel {
  ItemCartModel({
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
