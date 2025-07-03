import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BadgeStatus extends StatelessWidget {
  const BadgeStatus({
    super.key, 
    required this.status,
  }) : assert(
         status == 'active' || status == 'notActive',
         'Status must be either "active" or "notActive"',
       );
  
  final String status;
  
  @override
  Widget build(BuildContext context) {
    final bool isActive = status == 'active';
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [Colors.green, Colors.green.shade600]
              : [Colors.red, Colors.red.shade600],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: (isActive ? Colors.green : Colors.red).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.cancel,
            size: 14.sp,
            color: Colors.white,
          ),
          SizedBox(width: 4.w),
          Text(
            isActive ? "نشط" : "غير نشط",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}