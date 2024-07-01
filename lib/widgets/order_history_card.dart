// lib/widgets/order_history_card.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../common/text_styles.dart';
import '../common/colors.dart';
import '../pages/review_page.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  OrderHistoryCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ReviewPage(order: order),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: const BorderSide(color: PrimaryColor.c8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        order.imageUrl,
                        width: 80,
                        height: 80,
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
                            style: TextStyles.b1.copyWith(color: Colors.red),
                          ),
                          Text(
                            order.customerName,
                            style: TextStyles.b1,
                          ),
                          Text(
                            order.formattedPickupDate,
                            style: TextStyles.b1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Text(
                    'Rp ${order.totalPrice.toStringAsFixed(0)}',
                    style: TextStyles.h3.copyWith(color: PrimaryColor.c8),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
