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
            builder: (context) =>
                OrderDetailPage(order: order, items: order.items),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      order.imageUrl,
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('No. Pesanan',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text(order.orderNumber,
                                style:
                                    TextStyles.b1.copyWith(color: Colors.red)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Tanggal Pesan',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text(order.formattedOrderDate,
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Tanggal Ambil',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text(order.formattedPickupDate,
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Jam Ambil',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text(order.formattedPickupTime,
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Nama Pemesan',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text(order.customerName,
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Total',
                                style: TextStyles.b1
                                    .copyWith(color: Colors.black)),
                            const Spacer(),
                            Text('Rp ${order.totalPrice.toStringAsFixed(0)}',
                                style: TextStyles.b1
                                    .copyWith(color: PrimaryColor.c8)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Divider(
                  color: PrimaryColor.c8,
                  thickness: 1,
                  height: 1),
              const SizedBox(height: 8.0),
              if (order.status == 'Pesanan Baru')
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: onReject,
                      child: Text('Tolak'),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: TextStyles.b1),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: onAccept,
                      child: Text('Terima'),
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
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align buttons to the right
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _launchWhatsApp(order.customerNumber);
                      },
                      icon: Image.asset('assets/icons/whatsapp.png'),
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
                          textStyle: TextStyles.b1),
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
