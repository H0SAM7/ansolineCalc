import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle style22() {
    return TextStyle(
      color: Colors.black,
      fontSize: 21.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style32( Color color) {
    return TextStyle(
      color: color,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style18(

  ) {
    return  TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w200,
        color: Colors.black);
  }
    static TextStyle style20(

  ) {
    return  TextStyle(
        fontSize: 20.sp,        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle style16Gray(

  ) {
    return  TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 97, 96, 96),
    );
  }


  static TextStyle style16(

  ) {
    return  TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 60, 59, 59),
    );
  }
    static TextStyle style14(

  ) {
    return  TextStyle(
      fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 60, 59, 59),
    );
  }
}
