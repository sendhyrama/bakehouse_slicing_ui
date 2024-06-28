// lib/models/order.dart
import 'order_item.dart';

class Order {
  final String orderNumber;
  final String orderDate;
  final String pickupDate;
  final String customerName;
  final double total;
  final String imageUrl;
  String status;
  final List<OrderItem> items;
  String note; // Note field

  Order({
    required this.orderNumber,
    required this.orderDate,
    required this.pickupDate,
    required this.customerName,
    required this.total,
    required this.imageUrl,
    this.status = 'Pesanan Baru',
    required this.items,
    required this.note, // Initialize the note field
  });

  static List<Order> getMockOrders() {
    return [
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024',
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 2,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 1,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gatau',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
      ),
      Order(
        orderNumber: 'NP26030BTY',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024',
        customerName: 'Hilmy',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 2,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 1,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'gatau',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'sendhy cakeppp',
      ),
      Order(
        orderNumber: 'NP26030BTS',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024',
        customerName: 'Sendhy',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 2,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 1,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'gatau',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'sendhy cakeppp',
      ),
      Order(
        orderNumber: 'NP26030BTX',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024',
        customerName: 'Ramadhinata',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 2,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 1,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'gatau',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'sendhy cakeppp',
      ),
      Order(
        orderNumber: 'NP26030BTJ',
        orderDate: '10/05/2024',
        pickupDate: '11/05/2024',
        customerName: 'Pak Agus',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 2,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 1,
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'gatau',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'sendhy cakeppp',
      ),
    ];
  }

  double get subtotal {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  double get tax {
    return subtotal * 0.01; // Example tax rate of 1%
  }

  double get totalPrice {
    return subtotal + tax;
  }
}
