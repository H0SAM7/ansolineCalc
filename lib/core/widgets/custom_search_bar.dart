// // core/widgets/custom_search_bar.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomSearchBar extends StatelessWidget {
//   const CustomSearchBar({
//     super.key,
//     required this.onSearchChanged,
//     this.hintText = 'البحث...',
//     this.controller,
//   });

//   final Function(String) onSearchChanged;
//   final String hintText;
//   final TextEditingController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: TextField(
//         controller: controller,
//         onChanged: onSearchChanged,
//         textAlign: TextAlign.right,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: Colors.grey[600],
//             fontSize: 14.sp,
//           ),
//           prefixIcon: Icon(
//             Icons.search,
//             color: blue2,
//             size: 20.sp,
//           ),
//           suffixIcon: controller?.text.isNotEmpty == true
//               ? IconButton(
//                   onPressed: () {
//                     controller?.clear();
//                     onSearchChanged('');
//                   },
//                   icon: Icon(
//                     Icons.clear,
//                     color: Colors.grey[600],
//                     size: 20.sp,
//                   ),
//                 )
//               : null,
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16.w,
//             vertical: 12.h,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FilterOption {
//   final String label;
//   final String value;
//   final bool isSelected;

//   FilterOption({
//     required this.label,
//     required this.value,
//     this.isSelected = false,
//   });

//   FilterOption copyWith({
//     String? label,
//     String? value,
//     bool? isSelected,
//   }) {
//     return FilterOption(
//       label: label ?? this.label,
//       value: value ?? this.value,
//       isSelected: isSelected ?? this.isSelected,
//     );
//   }
// }

// class CustomFilterBar extends StatelessWidget {
//   const CustomFilterBar({
//     super.key,
//     required this.filters,
//     required this.onFilterChanged,
//     this.showFilterIcon = true,
//   });

//   final List<FilterOption> filters;
//   final Function(List<FilterOption>) onFilterChanged;
//   final bool showFilterIcon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//       child: Row(
//         children: [
//           if (showFilterIcon)
//             Icon(
//               Icons.filter_list,
//               color: blue2,
//               size: 20.sp,
//             ),
//           if (showFilterIcon) SizedBox(width: 8.w),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: filters.length,
//               itemBuilder: (context, index) {
//                 final filter = filters[index];
//                 return Container(
//                   margin: EdgeInsets.only(right: 8.w),
//                   child: FilterChip(
//                     label: Text(
//                       filter.label,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         color: filter.isSelected ? Colors.white : Colors.black87,
//                       ),
//                     ),
//                     selected: filter.isSelected,
//                     onSelected: (selected) {
//                       final updatedFilters = filters.map((f) {
//                         if (f.value == filter.value) {
//                           return f.copyWith(isSelected: selected);
//                         }
//                         return f;
//                       }).toList();
//                       onFilterChanged(updatedFilters);
//                     },
//                     selectedColor: blue2,
//                     backgroundColor: Colors.grey[200],
//                     checkmarkColor: Colors.white,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// mixin SearchAndFilterMixin<T extends StatefulWidget> on State<T> {
//   late TextEditingController searchController;
//   String searchQuery = '';
//   List<FilterOption> filters = [];

//   @override
//   void initState() {
//     super.initState();
//     searchController = TextEditingController();
//     initializeFilters();
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   // Override this method in your widget to set up filters
//   void initializeFilters() {
//     // Default implementation - override in your widget
//   }

//   void onSearchChanged(String query) {
//     setState(() {
//       searchQuery = query;
//     });
//     onFilterApplied();
//   }

//   void onFiltersChanged(List<FilterOption> updatedFilters) {
//     setState(() {
//       filters = updatedFilters;
//     });
//     onFilterApplied();
//   }

//   // Override this method to handle filter application
//   void onFilterApplied() {
//     // Default implementation - override in your widget
//   }

//   List<String> getSelectedFilters() {
//     return filters.where((f) => f.isSelected).map((f) => f.value).toList();
//   }

//   bool hasActiveFilters() {
//     return searchQuery.isNotEmpty || filters.any((f) => f.isSelected);
//   }

//   void clearAllFilters() {
//     setState(() {
//       searchQuery = '';
//       searchController.clear();
//       filters = filters.map((f) => f.copyWith(isSelected: false)).toList();
//     });
//     onFilterApplied();
//   }
// }