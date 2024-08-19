import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final String? message;

  const EmptyState({
    required this.title,
    required this.icon,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyles.h3.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 4.0),
              Text(
                message!,
                style: TextStyles.b1.copyWith(color: NeutralColor.c5),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
