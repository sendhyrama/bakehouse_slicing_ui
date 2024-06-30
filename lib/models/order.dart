// lib/models/order.dart
import 'package:intl/intl.dart';

import 'order_item.dart';

class Order {
  final String orderNumber;
  final DateTime orderDate;
  final DateTime pickupDate;
  final String customerName;
  final double total;
  final String imageUrl;
  String status;
  final List<OrderItem> items;
  String note; // Note field
  final double? rating;
  final String reviewText;
  final List<String>? reviewImages;

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
    this.rating,
    required this.reviewText,
    this.reviewImages,
  });

  static List<Order> getMockOrders() {
    return [
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        ],
      ),
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        ],
      ),
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        ],
      ),
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        ],
      ),
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
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
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
            amount: 8,
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan Happy Birthday',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
          'https://storage.googleapis.com/bucket-sendhyrama/sendhy-with-lil-sister.jpg',
        ],
      ),
      // Other mock orders...
    ];
  }

  String get formattedOrderDate => DateFormat('dd/MM/yyyy').format(orderDate);

  String get formattedPickupDate => DateFormat('dd/MM/yyyy').format(pickupDate);

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
