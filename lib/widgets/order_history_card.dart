// lib/widgets/order_history_card.dart
import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  OrderHistoryCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.blue, width: 2), // Outline border with blue color
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                order.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.orderNumber,
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Text(order.customerName),
                  Text('${order.pickupDate.split(' ')[0]} ${order.pickupDate.split(' ')[1]}'),
                ],
              ),
            ),
            Text(
              'Rp ${order.total.toStringAsFixed(0)}',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
