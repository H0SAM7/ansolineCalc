import 'package:calculator/core/styles/text_styles.dart';
import 'package:calculator/core/utils/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {super.key,
      required this.title,
      this.leading,
      this.onTap,
      this.trailing});
  final String title;
  final Widget? leading;
  final Widget? trailing;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: AppStyles.style18().copyWith(fontSize: 18),
          ),
          trailing: trailing ??
              Image.asset(
                Assets.iconsLeftarrow,
                color:  Colors.orange,
                height: 20.h,
              ),
        ),
      ),
    );
  }
}
