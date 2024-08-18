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
        orderNumber: 'NP204AKD',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11 08:00'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl: 'assets/products/choco-cake.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/choco-cake.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/lemon-tartlet.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 8,
            pricePerUnit: 8000,
            imageUrl: 'assets/products/vegan-donut.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Happy Birthday Radinka"',
        rating: 5,
        reviewText:
            'Kue coklat nya enak, pas banget rasanya ga bikin eneg temen-temen juga suka 🥰',
        reviewImages: [
          'assets/products/choco-cake.png',
          'assets/products/lemon-tartlet.png',
          'assets/products/vegan-donut.png',
        ],
      ),
      Order(
        orderNumber: 'NP201AKA',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11 08:00'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl: 'assets/products/lemon-tartlet.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/choco-cake.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/lemon-tartlet.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 8000,
            imageUrl: 'assets/products/vegan-donut.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Semhastulation!"',
        rating: 5,
        reviewText: 'Mantap!',
        reviewImages: [
          'assets/products/choco-cake.png',
          'assets/products/lemon-tartlet.png',
          'assets/products/vegan-donut.png',
        ],
      ),
      Order(
        orderNumber: 'NP202AKB',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-11 08:00'),
        customerName: 'Radinka',
        customerNumber: '628113300039',
        total: 170690,
        imageUrl: 'assets/products/vegan-donut.png',
        items: [
          OrderItem(
            name: 'Choco Cake',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/choco-cake.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/lemon-tartlet.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 1,
            pricePerUnit: 8000,
            imageUrl: 'assets/products/vegan-donut.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Tidak ada',
        rating: 5,
        reviewText: 'Enak pake bangett!',
        reviewImages: [
          'assets/products/choco-cake.png',
          'assets/products/lemon-tartlet.png',
          'assets/products/vegan-donut.png',
        ],
      ),
      Order(
        orderNumber: 'NP203AKC',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-12 13:00'),
        customerName: 'Sendhy',
        customerNumber: '6282150103051',
        total: 170690,
        imageUrl: 'assets/products/choco-soes.png',
        items: [
          OrderItem(
            name: 'Choco Soes',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/choco-soes.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 2,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/lemon-tartlet.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 8000,
            imageUrl: 'assets/products/vegan-donut.png',
            unit: 'Pcs',
          ),
        ],
        note: 'Request dikasih tulisan "Hai kamu, hbd ya!"',
        rating: 5,
        reviewText: 'Enak teksturnya lembut, worth to try!',
        reviewImages: [
          'assets/products/choco-soes.png',
          'assets/products/lemon-tartlet.png',
          'assets/products/vegan-donut.png',
        ],
      ),
      Order(
        orderNumber: 'NP200AKM',
        orderDate: DateTime.parse('2024-05-10'),
        pickupDate: DateTime.parse('2024-05-12 13:00'),
        customerName: 'Sendhy',
        customerNumber: '6282150103051',
        total: 170690,
        imageUrl: 'assets/products/mille-crepes.png',
        items: [
          OrderItem(
            name: 'Mille Crepes',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 4,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/mille-crepes.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Lemon Tartlet',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 35000,
            imageUrl: 'assets/products/lemon-tartlet.png',
            unit: 'Pcs',
          ),
          OrderItem(
            name: 'Vegan Donut',
            size: 'Potongan',
            variant: 'Gluten-free',
            quantity: 3,
            pricePerUnit: 8000,
            imageUrl: 'assets/products/vegan-donut.png',
            unit: 'Pcs',
          ),
        ],
        note: 'semangat skripsinyaa!',
        rating: 5,
        reviewText: 'Pertama kali nyoba kue seenak inii',
        reviewImages: [
          'assets/products/mille-crepes.png',
          'assets/products/lemon-tartlet.png',
          'assets/products/vegan-donut.png',
        ],
      ),
    ];
  }

  String get formattedOrderDate => DateFormat('dd/MM/yyyy').format(orderDate);

  String get formattedPickupDate => DateFormat('dd/MM/yyyy').format(pickupDate);

  String get formattedPickupTime => DateFormat('HH:mm').format(pickupDate);

  String get formattedPickupDateTime =>
      DateFormat('dd/MM/yyyy HH:mm').format(pickupDate);

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
