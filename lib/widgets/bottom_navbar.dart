import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final double height;

  BottomNavBar(
      {required this.selectedIndex,
      required this.onItemTapped,
      this.height = 70.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/beranda.svg", 0),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/inventaris.svg", 1),
            label: 'Inventaris',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/pesanan.svg", 2),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/keuangan.svg", 3),
            label: 'Keuangan',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/profil.svg", 4),
            label: 'Profil',
          ),
        ],
        selectedItemColor: NeutralColor.c9,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyles.b2.copyWith(color: NeutralColor.c9),
        unselectedLabelStyle: TextStyles.b2.copyWith(color: Colors.grey),
      ),
    );
  }

  Widget _buildSvgIcon(String assetPath, int index) {
    return SvgPicture.asset(
      assetPath,
      color: selectedIndex == index ? null : Colors.grey,
    );
  }
}
