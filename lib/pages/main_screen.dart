// lib/pages/main_screen.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import 'inventory_page.dart';
import 'order_page.dart';
import 'home_page.dart';
import 'finance_page.dart';
import 'profile_page.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // Adjust this index if needed

  final List<Widget> _pages = [
    const InventoryPage(),
    const OrderPage(),
    const HomePage(),
    const FinancePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Brightness.light,
    ));
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
