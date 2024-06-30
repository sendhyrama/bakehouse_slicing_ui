// lib/widgets/empty_state.dart
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final SvgPicture icon;

  EmptyState({required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 16.0),
          Text(
            message,
            style: TextStyles.h3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
