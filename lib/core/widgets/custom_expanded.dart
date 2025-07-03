
import 'package:calculator/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomExpandedItem extends StatelessWidget {
  const CustomExpandedItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[200]!),
      ),

      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
    color: Colors.orange,            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon,     color: Colors.orange, size: 20.w),
        ),
        title: Text(
          title,
          style: AppStyles.style16().copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppStyles.style14().copyWith(color: Colors.grey[600]),
        ),
        trailing: Icon(Icons.arrow_forward_ios,    color: Colors.orange, size: 18.w),
        onTap: onTap,
      ),
    );
  }
}

class CustomExpanded extends StatelessWidget {
  const CustomExpanded({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });
  final String title;
  final IconData icon;
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(16.w),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
    color: Colors.orange,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon,    color: Colors.orange, size: 20.w),
        ),
        title: Text(
          title,
          style: AppStyles.style16().copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        trailing: Icon(Icons.expand_more,    color: Colors.orange, size: 24.w),
        children: items,
      ),
    );
  }
}
