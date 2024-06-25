// lib/pages/orders_page.dart
import 'package:bakehouse_slicing_ui/widgets/order_page_header.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/order_card.dart';
import '../widgets/order_status_tabs.dart';
import '../widgets/search_bar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrderPage> {
  bool isStatusSelected = true;
  int selectedTabIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<Order> orders = [];
  List<Order> filteredOrders = [];

  @override
  void initState() {
    super.initState();
    orders = Order.getMockOrders();
    filteredOrders = orders.where((order) => order.status == 'Pesanan Baru').toList();
  }

  void handleStatusPressed() {
    setState(() {
      isStatusSelected = true;
    });
  }

  void handleHistoryPressed() {
    setState(() {
      isStatusSelected = false;
    });
  }

  void handleFilterPressed() {
    // Filter functionality here
  }

  void handleTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
      switch (index) {
        case 0:
          filteredOrders = orders.where((order) => order.status == 'Pesanan Baru').toList();
          break;
        case 1:
          filteredOrders = orders.where((order) => order.status == 'Diproduksi').toList();
          break;
        case 2:
          filteredOrders = orders.where((order) => order.status == 'Dikemas').toList();
          break;
        case 3:
          filteredOrders = orders.where((order) => order.status == 'Siap diambil').toList();
          break;
      }
    });
  }

  void handleSearch(String query) {
    setState(() {
      filteredOrders = orders.where((order) {
        return (order.customerName.toLowerCase().contains(query.toLowerCase()) ||
            order.orderNumber.toLowerCase().contains(query.toLowerCase())) &&
            order.status == getStatusByTabIndex(selectedTabIndex);
      }).toList();
    });
  }

  String getStatusByTabIndex(int index) {
    switch (index) {
      case 0:
        return 'Pesanan Baru';
      case 1:
        return 'Diproduksi';
      case 2:
        return 'Dikemas';
      case 3:
        return 'Siap diambil';
      default:
        return 'Pesanan Baru';
    }
  }

  String getNextStatus(String currentStatus) {
    switch (currentStatus) {
      case 'Pesanan Baru':
        return 'Diproduksi';
      case 'Diproduksi':
        return 'Dikemas';
      case 'Dikemas':
        return 'Siap diambil';
      default:
        return 'Pesanan Baru';
    }
  }

  void handleUpdateStatus(Order order) {
    setState(() {
      order.status = getNextStatus(order.status);
      handleTabSelected(selectedTabIndex); // Update the filtered orders
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              OrderPageHeader(
                onStatusPressed: handleStatusPressed,
                onHistoryPressed: handleHistoryPressed,
                onFilterPressed: handleFilterPressed,
                isStatusSelected: isStatusSelected,
              ),
              OrderStatusTabs(
                selectedIndex: selectedTabIndex,
                onTabSelected: handleTabSelected,
              ),
              SearchBarr(
                controller: searchController,
                onSearch: handleSearch,
              ),
              Expanded(
                child: constraints.maxWidth > 600
                    ? GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                        ),
                        itemCount: filteredOrders.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            order: filteredOrders[index],
                            items: const [], // Pass the appropriate order items
                            onUpdateStatus: () => handleUpdateStatus(filteredOrders[index]),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: filteredOrders.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            order: filteredOrders[index],
                            items: const [], // Pass the appropriate order items
                            onUpdateStatus: () => handleUpdateStatus(filteredOrders[index]),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
