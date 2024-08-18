// lib/pages/order_detail_page.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/order_item.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  final List<OrderItem> items;

  OrderDetailPage({required this.order, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lihat Pesanan',
          style: TextStyles.h3,
        ),
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
                  Text(
                    'Rp ${order.totalPrice.toStringAsFixed(0)}',
                    style: TextStyles.h2.copyWith(color: PrimaryColor.c7),
                  ),
                ],
              ),
            ),
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            items[index].imageUrl,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].name,
                                style: TextStyles.h3
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ukuran',
                                          style: TextStyles.b2,
                                        ),
                                        Text(
                                          items[index].size,
                                          style: TextStyles.b2.copyWith(fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                  const SizedBox(width: 8.0),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Varian',
                                          style: TextStyles.b2,
                                        ),
                                        Text(
                                          items[index].variant,
                                          style: TextStyles.b2.copyWith(fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                  const SizedBox(width: 10.0),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(''),
                                        Text(
                                          '${items[index].quantity} x Rp ${items[index].pricePerUnit.toStringAsFixed(0)}',
                                          style: TextStyles.b1
                                              .copyWith(color: NeutralColor.c6),
                                        ),
                                      ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${items[index].quantity} ${items[index].unit}',
                                      style: TextStyles.b1,
                                    ),
                                  ),
                                  Text(
                                      'Rp ${items[index].totalPrice.toStringAsFixed(0)}',
                                      style: TextStyles.h4
                                          .copyWith(color: PrimaryColor.c7, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Text("Catatan:", style: TextStyles.h4.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Text(
                order.note,
                style: TextStyles.b1.copyWith(color: NeutralColor.c8),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal', style: TextStyles.b1),
                      Text('Rp ${order.subtotal.toStringAsFixed(0)}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pajak Layanan (1%)', style: TextStyles.b1),
                      Text('Rp ${order.tax.toStringAsFixed(0)}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyles.h3,
                      ),
                      Text(
                        'Rp ${order.totalPrice.toStringAsFixed(0)}',
                        style: TextStyles.h3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
