// lib/pages/review_page.dart
import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';
import '../models/order.dart';

class ReviewPage extends StatelessWidget {
  final Order order;

  ReviewPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Ulasan', style: TextStyles.h3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Column(
              children: [
                Text(order.customerName, style: TextStyles.h3),
                Text('Rp ${order.totalPrice.toStringAsFixed(0)}',
                    style: TextStyles.h2.copyWith(color: PrimaryColor.c7)),
              ],
            )),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('No. Pesanan',
                        style: TextStyles.b1.copyWith(color: NeutralColor.c6)),
                    Text(order.orderNumber,
                        style: TextStyles.b1.copyWith(color: Colors.red)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Tanggal Pesan',
                        style: TextStyles.b1.copyWith(color: NeutralColor.c6)),
                    Text(order.formattedOrderDate, style: TextStyles.b1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Waktu Ambil',
                        style: TextStyles.b1.copyWith(color: NeutralColor.c6)),
                    Text(order.formattedPickupDateTime, style: TextStyles.b1),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Penilaian',
                    style: TextStyles.h4.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4.0),
                order.rating != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < order.rating!
                                ? Icons.star
                                : Icons.star_border,
                            color: WarningColor.c5,
                          ),
                        ),
                      )
                    : Text('Belum ada ulasan',
                        style: TextStyles.b1.copyWith(color: Colors.grey)),
              ],
            )),
            const SizedBox(height: 16.0),
            const Text('Ulasan', style: TextStyles.h4),
            const SizedBox(height: 8.0),
            Row(
              children: [
                ...List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              order.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
              ],
            ),
            const SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.white,
              ),
              child: Text(order.reviewText, style: TextStyles.b1),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => context,
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: PrimaryColor.c7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text('Balas'),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('Produk',
                style: TextStyles.h4.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: order.items
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.name, style: TextStyles.b1),
                            Text(item.unit),
                            Text(
                                '${item.quantity} x ${item.pricePerUnit.toStringAsFixed(0)}',
                                style: TextStyles.b1),
                            Text(
                                (item.quantity * item.pricePerUnit)
                                    .toStringAsFixed(0),
                                style: TextStyles.b1),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8.0),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
