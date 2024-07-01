// lib/widgets/search_bar.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarr extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final VoidCallback onFilterPressed;

  SearchBarr({required this.controller, required this.onSearch, required this.onFilterPressed}) {
    // Add listener to the controller to handle live search
    controller.addListener(() {
      onSearch(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
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
                        hintStyle: TextStyles.b1,
                      ),
                      onChanged: (text) {
                        // Call onSearch directly when text changes
                        onSearch(text);
                      },
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/search.svg'),
                    onPressed: () => onSearch(controller.text),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: PrimaryColor.c8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: PrimaryColor.c8,
              ),
              onPressed: onFilterPressed,
            ),
          ),
        ],
      ),
    );
  }
}
