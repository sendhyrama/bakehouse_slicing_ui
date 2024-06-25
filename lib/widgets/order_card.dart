// lib/widgets/order_card.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/order_item.dart';
import '../pages/order_detail_page.dart';
import 'update_status_dialog.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final List<OrderItem> items;
  final VoidCallback onUpdateStatus;

  OrderCard({required this.order, required this.items, required this.onUpdateStatus});

  void _showUpdateStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UpdateStatusDialog(
          onConfirm: () {
            onUpdateStatus();
            Navigator.of(context).pop();
          },
          currentStatus: order.status,
        );
      },
    );
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
        return 'Siap Produksi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderDetailPage(order: order, items: items),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: PrimaryColor.c8), // Outline border with blue color
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
                        Text('Tanggal Pesan: ${order.orderDate}'),
                        const SizedBox(height: 4.0),
                        Text('Waktu Ambil: ${order.pickupDate}'),
                        const SizedBox(height: 4.0),
                        Text('Nama Pemesan: ${order.customerName}'),
                        const SizedBox(height: 4.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Total: ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Rp ${order.total.toStringAsFixed(0)}',
                                style: const TextStyle(color: PrimaryColor.c8),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Chat functionality here
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text('Chat Pembeli', style: TextStyles.b2,),
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
                    onPressed: () {
                      _showUpdateStatusDialog(context);
                    },
                    child: Text("Perbarui Status", style: TextStyles.b2,),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: PrimaryColor.c8,
                      side: const BorderSide(color: PrimaryColor.c8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
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
