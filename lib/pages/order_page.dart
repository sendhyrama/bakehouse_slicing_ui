// lib/pages/order_page.dart
import 'package:bakehouse_slicing_ui/widgets/empty_state.dart';
import 'package:bakehouse_slicing_ui/widgets/order_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/order.dart';
import '../widgets/order_card.dart';
import '../widgets/order_history_card.dart';
import '../widgets/order_status_tabs.dart';
import '../widgets/order_history_tabs.dart';
import '../widgets/search_bar.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/filter_indicator.dart';

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
  DateTime? startDate;
  DateTime? endDate;
  Map<int, DateTime?> startDates = {};
  Map<int, DateTime?> endDates = {};
  bool isFilterActive() {
    return startDates[selectedTabIndex] != null &&
        endDates[selectedTabIndex] != null;
  }

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

  void clearFilter() {
    setState(() {
      startDates[selectedTabIndex] = null;
      endDates[selectedTabIndex] = null;
      filterOrders();
    });
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
    if (isStatusSelected) {
      switch (index) {
        case 0:
          return 'Pesanan Baru';
        case 1:
          return 'Diproduksi';
        case 2:
          return 'Dikemas';
        case 3:
          return 'Siap Diambil';
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
        return 'Siap Diambil';
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
          title: 'Terima Pesanan',
          content: 'Apakah Anda Yakin?',
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
          title: 'Tolak Pesanan',
          content: 'Apakah Anda Yakin?',
          onConfirm: () {
            setState(() {
              order.status = 'Ditolak';
              filterOrders();
            });
            Navigator.of(context).pop();
          },
          confirmText: 'Tolak',
          isReject: true,
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
              orders.remove(order); // Remove from current list
              orders.add(order); // Add to the end of the list to move it
              filterOrders();
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
            onFilterPressed: handleFilterPressed,
            isFilterActive: isFilterActive(),
          ),
          if (startDates[selectedTabIndex] != null &&
              endDates[selectedTabIndex] != null)
            FilterIndicator(
              startDate: startDates[selectedTabIndex],
              endDate: endDates[selectedTabIndex],
              onClearFilter: clearFilter,
            ),
          Expanded(
            child: filteredOrders.isEmpty
                ? searchController.text.isEmpty
                    ? EmptyState(
                        title: 'Masih belum ada pesanan nih!',
                        message:
                            'Pesanan Anda akan ditampilkan setelah Pelanggan melakukan transaksi.',
                        icon: SvgPicture.asset(
                          'assets/icons/no-orders.svg',
                          width: 200,
                          height: 200,
                        ),
                      )
                    : EmptyState(
                        title: 'Hasil pencarian tidak ditemukan',
                        message:
                            'Tidak ditemukan hasil untuk pencarian Anda. Coba ganti dengan kata kunci lain.',
                        icon: SvgPicture.asset(
                          'assets/icons/not-found.svg',
                          width: 200,
                          height: 200,
                        ),
                      )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      if (filteredOrders[index].status == 'Selesai' ||
                          filteredOrders[index].status == 'Ditolak') {
                        return OrderHistoryCard(order: filteredOrders[index]);
                      } else {
                        return OrderCard(
                          order: filteredOrders[index],
                          onUpdateStatus: () {
                            if (filteredOrders[index].status ==
                                'Siap Diambil') {
                              handleCompleteOrder(filteredOrders[index]);
                            } else {
                              handleShowUpdateDialog(filteredOrders[index]);
                            }
                          },
                          onAccept: () =>
                              handleAcceptOrder(filteredOrders[index]),
                          onReject: () =>
                              handleRejectOrder(filteredOrders[index]),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
