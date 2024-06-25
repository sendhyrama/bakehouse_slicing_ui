import 'package:flutter/material.dart';
import 'pages/main_screen.dart';
import 'pages/order_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: {
        '/order-history': (context) => OrderHistoryPage(),
      },
    );
  }
}
