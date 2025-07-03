import 'package:calculator/core/styles/text_styles.dart';
import 'package:calculator/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.widget,
    this.onTap,
    this.isPop,
  });
  final String? title;
  final Widget? widget;
  final void Function()? onTap;
  final bool? isPop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 16.w,right: 14.w,bottom: 4.h),
      
      child: Row(
        children: [
          (isPop != true)
              ? GestureDetector(
                onTap:
                    onTap ??
                    () {
                      Navigator.pop(context);
                    },
                child: Transform.rotate(
                  angle: 3.14159,
                  child: Image.asset(
                    Assets.iconsBack,
                    color: Colors.orange,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              )
              : SizedBox(),
    
          SizedBox(width: 7.w),
          title != null
              ? Text(
                title!,
                style: AppStyles.style20().copyWith(    color: Colors.orange,),
              )
              : SizedBox(),
          const Spacer(),
          widget ?? const SizedBox(),
        ],
      ),
    );
  }
}
