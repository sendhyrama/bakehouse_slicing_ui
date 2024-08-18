import 'dart:io';
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Future<void> _launchWhatsApp(String customerNumber) async {
    var androidUrl =
        "whatsapp://send?phone=$customerNumber&text=Hai ${order.customerName}";
    var iosUrl =
        "https://wa.me/$customerNumber?text=${Uri.parse('Hai ${order.customerName}')}";

    try {
      if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      } else {
        await launchUrl(Uri.parse(iosUrl));
      }
    } on Exception {
      throw 'Gagal membuka WhatsApp';
    }
  }

  String getNextStatusText(String status) {
    switch (status) {
      case 'Pesanan Baru':
        return 'Siap Produksi';
      case 'Diproduksi':
        return 'Dikemas';
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
            builder: (context) =>
                OrderDetailPage(order: order, items: order.items),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                            'No. Pesanan', order.orderNumber, Colors.red),
                        _buildInfoRow('Tgl. Pesan', order.formattedOrderDate),
                        _buildInfoRow('Tgl. Ambil', order.formattedPickupDate),
                        _buildInfoRow('Waktu Ambil', order.formattedPickupTime),
                        _buildInfoRow('Pemesan', order.customerName),
                        _buildInfoRow(
                            'Total',
                            'Rp ${order.totalPrice.toStringAsFixed(0)}',
                            PrimaryColor.c8),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      order.imageUrl,
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1), // Divider added back
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status',
                          style:
                              TextStyles.b1.copyWith(color: NeutralColor.c8)),
                      Text(order.status,
                          style: TextStyles.b1.copyWith(
                              color: PrimaryColor.c8,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (order.status == 'Pesanan Baru')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: onReject,
                              child: Text('Tolak'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: DangerColor.c5,
                                side: const BorderSide(color: DangerColor.c5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textStyle: TextStyles.b1,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: onAccept,
                              child: Text('Terima'),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyles.b1,
                                foregroundColor: Colors.white,
                                backgroundColor: SuccessColor.c5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _launchWhatsApp(order.customerNumber);
                              },
                              icon: Image.asset('assets/icons/whatsapp.png'),
                              label: const Text('Chat', style: TextStyles.b1),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: SuccessColor.c5,
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
                                textStyle: TextStyles.b1,
                              ),
                            ),
                          ],
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

  Widget _buildInfoRow(String label, String value, [Color? valueColor]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyles.b1,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyles.b1.copyWith(color: valueColor ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
