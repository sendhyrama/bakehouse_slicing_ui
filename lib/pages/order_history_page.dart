// lib/pages/order_history_page.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/order_history_card.dart';
import '../widgets/order_history_tabs.dart';
import '../widgets/search_bar.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedTabIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<Order> orders = [];
  List<Order> filteredOrders = [];

  @override
  void initState() {
    super.initState();
    orders = Order.getMockOrders(); // Assume getMockOrders is a static method that returns mock data
    filteredOrders = orders;
  }

  void handleTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
      // Filter orders based on the selected tab
      // For simplicity, assume all orders are 'Selesai'
      filteredOrders = orders.where((order) => true).toList();
    });
  }

  void handleSearch(String query) {
    setState(() {
      filteredOrders = orders.where((order) {
        return order.customerName.toLowerCase().contains(query.toLowerCase()) ||
            order.orderNumber.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void handleFilterPressed() {
    // Filter functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          OrderHistoryTabs(
            selectedIndex: selectedTabIndex,
            onTabSelected: handleTabSelected,
          ),
          SearchBarr(
            controller: searchController,
            onSearch: handleSearch,
            onFilterPressed: handleFilterPressed,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                return OrderHistoryCard(order: filteredOrders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
