class Order {
  final String orderNumber;
  final String orderDate;
  final String pickupDate;
  final String customerName;
  final double total;
  final String imageUrl;
  String status;

  Order({
    required this.orderNumber,
    required this.orderDate,
    required this.pickupDate,
    required this.customerName,
    required this.total,
    required this.imageUrl,
    this.status = 'Pesanan Baru',
  });

  static List<Order> getMockOrders() {
    return [
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024 13:00',
        customerName: 'Radinka',
        total: 200000,
        imageUrl: 'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
      ),
      Order(
        orderNumber: 'NP26030BTY',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024 13:00',
        customerName: 'Hilmy',
        total: 200000,
        imageUrl: 'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
      ),
    ];
  }
}
