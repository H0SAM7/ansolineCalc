import 'package:calculator/core/styles/text_styles.dart';
import 'package:calculator/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomErrView extends StatelessWidget {
  const CustomErrView({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesErr,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(errMessage,style: AppStyles.style20( ),),
        ),
      ],
    );
  }
}
