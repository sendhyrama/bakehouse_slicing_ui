// lib/widgets/order_card.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:flutter/material.dart';
import '../common/text_styles.dart';
import '../models/order.dart';
import '../pages/order_detail_page.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onUpdateStatus;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  OrderCard({
    required this.order,
    required this.onUpdateStatus,
    required this.onAccept,
    required this.onReject,
  });

  String getNextStatusText(String status) {
    switch (status) {
      case 'Pesanan Baru':
        return 'Siap Produksi';
      case 'Diproduksi':
        return 'Siap Dikemas';
      case 'Dikemas':
        return 'Siap Diambil';
      default:
        return 'Selesai';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderDetailPage(order: order, items: order.items),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: PrimaryColor.c8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      order.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'No. Pesanan: ',
                                style: TextStyles.b1.copyWith(color: Colors.black),
                              ),
                              TextSpan(
                                text: order.orderNumber,
                                style: TextStyles.b1.copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text('Tanggal Pesan: ${order.orderDate}', style: TextStyles.b1.copyWith(color: Colors.black),),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text('Waktu Ambil: ${order.pickupDate}', style: TextStyles.b1.copyWith(color: Colors.black),),
                            const SizedBox(width: 8.0),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Text('Nama Pemesan: ${order.customerName}', style: TextStyles.b1.copyWith(color: Colors.black),),
                        const SizedBox(height: 4.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Total: ',
                                style: TextStyles.b1.copyWith(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Rp ${order.total.toStringAsFixed(0)}',
                                style: TextStyles.b1.copyWith(color: PrimaryColor.c8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Divider(color: Colors.grey, thickness: 1, height: 1), // Full horizontal divider
              const SizedBox(height: 8.0),
              if (order.status == 'Pesanan Baru')
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: onReject,
                      child: const Text('Tolak'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyles.b1
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: onAccept,
                      child: const Text('Terima'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyles.b1,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Chat functionality here
                      },
                      icon: const Icon(Icons.chat),
                      label: const Text('Chat Pembeli', style: TextStyles.b1),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton(
                      onPressed: onUpdateStatus,
                      child: Text(getNextStatusText(order.status)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: PrimaryColor.c8,
                        side: const BorderSide(color: PrimaryColor.c8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyles.b1
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
