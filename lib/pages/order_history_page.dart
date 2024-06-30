// lib/pages/order_history_page.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/filter_bottom_sheet.dart';
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
  Map<int, DateTime?> startDates = {};
  Map<int, DateTime?> endDates = {};

  @override
  void initState() {
    super.initState();
    orders = Order.getMockOrders(); // Assume getMockOrders is a static method that returns mock data
    filterOrders();
  }

  void handleTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
      filterOrders();
    });
  }

  void handleSearch(String query) {
    setState(() {
      filterOrders();
    });
  }

  void handleFilterPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FilterBottomSheet(
          onApplyFilter: applyFilter,
          initialStartDate: startDates[selectedTabIndex],
          initialEndDate: endDates[selectedTabIndex],
        );
      },
    );
  }

  void applyFilter(DateTime start, DateTime end) {
    setState(() {
      startDates[selectedTabIndex] = start;
      endDates[selectedTabIndex] = end;
      filterOrders();
    });
  }

  void filterOrders() {
    if (selectedTabIndex == 0) {
      filteredOrders = orders
          .where((order) => order.status == 'Selesai' && orderMatchesSearch(order))
          .toList();
    } else if (selectedTabIndex == 1) {
      filteredOrders = orders
          .where((order) => order.status == 'Dibatalkan' && orderMatchesSearch(order))
          .toList();
    } else {
      filteredOrders = orders
          .where((order) => order.status == 'Ditolak' && orderMatchesSearch(order))
          .toList();
    }
  }

  bool orderMatchesSearch(Order order) {
    String query = searchController.text.toLowerCase();
    return order.customerName.toLowerCase().contains(query) ||
        order.orderNumber.toLowerCase().contains(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
