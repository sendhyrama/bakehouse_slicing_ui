import 'package:bakehouse_slicing_ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'pages/order_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakehouse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/order-history': (context) => OrderHistoryPage(),
      },
    );
  }
}
