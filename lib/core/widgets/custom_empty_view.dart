import 'package:calculator/core/styles/text_styles.dart';
import 'package:calculator/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomEmptyView extends StatelessWidget {
  const CustomEmptyView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesNodataCuate,
          fit: BoxFit.cover,
        ),
        Text(text,style: AppStyles.style32( Colors.white),),
      ],
    );
  }
}
