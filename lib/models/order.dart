// lib/models/order.dart
import 'package:intl/intl.dart';

import 'order_item.dart';

class Order {
  final String orderNumber;
  final DateTime orderDate;
  final DateTime pickupDate;
  final String customerName;
  final String customerNumber;
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
    required this.customerNumber,
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
        orderNumber: 'NP24034AKD',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
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
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gluten-free',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Happy Birthday Radinka"',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
        ],
      ),
      Order(
        orderNumber: 'NP24031AKA',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Semhastulation!"',
        rating: 5,
        reviewText:
            'Mantap!',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
        ],
      ),
      Order(
        orderNumber: 'NP24032AKB',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
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
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Tidak ada',
        rating: 5,
        reviewText:
            'Enak pake bangett!',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto3.png',
        ],
      ),
      Order(
        orderNumber: 'NP24033AKC',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Sendhy',
        customerNumber: '628113300039',
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
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Hai kamu, hbd ya!"',
        rating: 5,
        reviewText:
            'Enak teksturnya lembut, worth to try!',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto4.png',
        ],
      ),
      Order(
        orderNumber: 'NP24030AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11'),
        customerName: 'Sendhy',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl:
            'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'D18',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 35000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto1.png',
            unit: 'Slice',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Small',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 8000,
            imageUrl:
                'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto2.png',
            unit: 'Pcs',
          ),
        ],
        note: 'semangat skripsinyaa!',
        rating: 5,
        reviewText:
            'Pertama kali nyoba kue seenak inii',
        reviewImages: [
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
          'https://storage.googleapis.com/bucket-sendhyrama/bakehouse/foto5.png',
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
