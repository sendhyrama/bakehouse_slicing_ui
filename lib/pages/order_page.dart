// lib/pages/order_page.dart
import 'package:bakehouse_slicing_ui/widgets/order_page_header.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../widgets/order_card.dart';
import '../widgets/order_status_tabs.dart';
import '../widgets/order_history_tabs.dart';
import '../widgets/search_bar.dart';
import '../widgets/custom_dialog.dart';

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
    filterOrders();
  }

  void handleStatusPressed() {
    setState(() {
      isStatusSelected = true;
      selectedTabIndex = 0;
      filterOrders();
    });
  }

  void handleHistoryPressed() {
    setState(() {
      isStatusSelected = false;
      selectedTabIndex = 0;
      filterOrders();
    });
  }

  void handleFilterPressed() {
    // Filter functionality here
  }

  void handleTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
      filterOrders();
    });
  }

  void handleSearch(String query) {
    setState(() {
      filteredOrders = orders.where((order) {
        return (order.customerName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                order.orderNumber
                    .toLowerCase()
                    .contains(query.toLowerCase())) &&
            order.status == getStatusByTabIndex(selectedTabIndex);
      }).toList();
    });
  }

  void filterOrders() {
    if (isStatusSelected) {
      switch (selectedTabIndex) {
        case 0:
          filteredOrders =
              orders.where((order) => order.status == 'Pesanan Baru').toList();
          break;
        case 1:
          filteredOrders =
              orders.where((order) => order.status == 'Diproduksi').toList();
          break;
        case 2:
          filteredOrders =
              orders.where((order) => order.status == 'Dikemas').toList();
          break;
        case 3:
          filteredOrders =
              orders.where((order) => order.status == 'Siap diambil').toList();
          break;
      }
    } else {
      switch (selectedTabIndex) {
        case 0:
          filteredOrders =
              orders.where((order) => order.status == 'Selesai').toList();
          break;
        case 1:
          filteredOrders =
              orders.where((order) => order.status == 'Dibatalkan').toList();
          break;
        case 2:
          filteredOrders =
              orders.where((order) => order.status == 'Ditolak').toList();
          break;
      }
    }
  }

  String getStatusByTabIndex(int index) {
    if (isStatusSelected) {
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
    } else {
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
      String nextStatus = getNextStatus(order.status);
      order.status = nextStatus;
      filterOrders();
    });
  }

  void handleAcceptOrder(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Konfirmasi Terima Pesanan',
          content: 'Apakah Anda yakin?',
          onConfirm: () {
            setState(() {
              order.status = 'Diproduksi';
              filterOrders();
            });
            Navigator.of(context).pop();
          },
          confirmText: 'Terima',
        );
      },
    );
  }

  void handleRejectOrder(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Konfirmasi Tolak Pesanan',
          content: 'Apakah Anda yakin?',
          onConfirm: () {
            setState(() {
              order.status = 'Ditolak';
              filterOrders();
            });
            Navigator.of(context).pop();
          },
          confirmText: 'Tolak',
        );
      },
    );
  }

  void handleCompleteOrder(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Konfirmasi Selesai',
          content: 'Apakah pesanan sudah selesai?',
          onConfirm: () {
            setState(() {
              order.status = 'Selesai';
              filterOrders();
              isStatusSelected = false;
              selectedTabIndex = 0;
            });
            Navigator.of(context).pop();
          },
          confirmText: 'Selesai',
        );
      },
    );
  }

  void handleShowUpdateDialog(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Perbarui Status',
          content: 'Apakah Anda yakin ingin memperbarui status pesanan ini?',
          onConfirm: () {
            handleUpdateStatus(order);
            Navigator.of(context).pop();
          },
          confirmText: getNextStatus(order.status),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OrderPageHeader(
            onStatusPressed: handleStatusPressed,
            onHistoryPressed: handleHistoryPressed,
            onFilterPressed: handleFilterPressed,
            isStatusSelected: isStatusSelected,
          ),
          isStatusSelected
              ? OrderStatusTabs(
                  selectedIndex: selectedTabIndex,
                  onTabSelected: handleTabSelected,
                )
              : OrderHistoryTabs(
                  selectedIndex: selectedTabIndex,
                  onTabSelected: handleTabSelected,
                ),
          SearchBarr(
            controller: searchController,
            onSearch: handleSearch,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  order: filteredOrders[index],
                  // items:context,index, // Pass the appropriate order items
                  onUpdateStatus: () {
                    if (filteredOrders[index].status == 'Siap diambil') {
                      handleCompleteOrder(filteredOrders[index]);
                    } else {
                      handleShowUpdateDialog(filteredOrders[index]);
                    }
                  },
                  onAccept: () => handleAcceptOrder(filteredOrders[index]),
                  onReject: () => handleRejectOrder(filteredOrders[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
