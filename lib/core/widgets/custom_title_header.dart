import 'package:calculator/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleHeader extends StatelessWidget {
  const CustomTitleHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.style22(
        
      )
    );
  }
}
