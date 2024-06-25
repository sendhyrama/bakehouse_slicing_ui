// lib/pages/order_detail_page.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/order_item.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  final List<OrderItem> items;

  OrderDetailPage({required this.order, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lihat Order'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order.customerName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            Text('Rp ${order.total.toStringAsFixed(0)}', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('No. Pesanan', style: TextStyle(color: Colors.grey)),
                Text(order.orderNumber, style: TextStyle(color: Colors.red)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Pesan', style: TextStyle(color: Colors.grey)),
                Text(order.orderDate),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Waktu Ambil', style: TextStyle(color: Colors.grey)),
                Text(order.pickupDate),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              items[index].imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[index].name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                                Text('Size: ${items[index].size}'),
                                Text('Variant: ${items[index].variant}'),
                                Text('${items[index].quantity} x Rp ${items[index].pricePerUnit.toStringAsFixed(0)}'),
                                Text('Rp ${items[index].totalPrice.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Catatan:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Request dikasih tulisan Happy Birthday', style: TextStyle(color: Colors.blue)),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: TextStyle(color: Colors.grey)),
                Text('Rp 160.000'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pajak', style: TextStyle(color: Colors.grey)),
                Text('Rp 1.000'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Rp 170.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
