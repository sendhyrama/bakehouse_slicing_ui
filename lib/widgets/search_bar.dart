// lib/widgets/search_bar.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarr extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  SearchBarr({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: PrimaryColor.c5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: 'Cari pesanan',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    hintStyle: TextStyles.b1),
                onSubmitted: onSearch,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: PrimaryColor.c8,
              ),
              onPressed: () => onSearch(controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
