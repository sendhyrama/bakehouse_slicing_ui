// lib/pages/order_history_page.dart
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/order_history_card.dart';
import '../widgets/order_history_tabs.dart';
import '../widgets/search_bar.dart';
import '../common/text_styles.dart';

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
    orders = Order.getMockOrders();
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
    DateTime? startDate = startDates[selectedTabIndex];
    DateTime? endDate = endDates[selectedTabIndex];
    filteredOrders = orders.where((order) {
      bool matchesSearch = orderMatchesSearch(order);
      bool matchesStatus =
          order.status == getStatusByTabIndex(selectedTabIndex);
      bool matchesDate =
          (startDate == null || order.orderDate.isAfter(startDate)) &&
              (endDate == null || order.orderDate.isBefore(endDate));
      return matchesSearch && matchesStatus && matchesDate;
    }).toList();
  }

  bool orderMatchesSearch(Order order) {
    String query = searchController.text.toLowerCase();
    return order.customerName.toLowerCase().contains(query) ||
        order.orderNumber.toLowerCase().contains(query);
  }

  String getStatusByTabIndex(int index) {
    switch (index) {
      case 0:
        return 'Selesai';
      case 1:
        return 'Dibatalkan';
      case 2:
        return 'Ditolak';
      default:
        return 'Selesai';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
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
            child: filteredOrders.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada pesanan yang ditemukan',
                      style: TextStyles.b1,
                    ),
                  )
                : ListView.builder(
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
