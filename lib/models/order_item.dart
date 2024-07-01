// lib/models/order_item.dart
class OrderItem {
  final String name;
  final String size;
  final String variant;
  final int quantity;
  final double pricePerUnit;
  final String imageUrl;
  final String unit;

  OrderItem({
    required this.name,
    required this.size,
    required this.variant,
    required this.quantity,
    required this.pricePerUnit,
    required this.imageUrl,
    required this.unit,
  });

  double get totalPrice => quantity * pricePerUnit;
}
