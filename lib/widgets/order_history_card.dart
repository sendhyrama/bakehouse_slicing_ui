// lib/widgets/order_history_card.dart
import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../models/order.dart';
import '../pages/order_detail_page.dart';
import '../pages/review_page.dart';
import '../common/text_styles.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  OrderHistoryCard({required this.order});

  void _handleCardTap(BuildContext context) {
    if (order.status == 'Selesai') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ReviewPage(order: order),
        ),
      );
    } else if (order.status == 'Ditolak' || order.status == 'Dibatalkan') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderDetailPage(order: order, items: order.items),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleCardTap(context),
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
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
                          const SizedBox(height: 4.0),
                          Text(
                            order.customerName,
                            style: TextStyles.b1,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            order.formattedPickupDateTime,
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
        )
    );
  }
}
