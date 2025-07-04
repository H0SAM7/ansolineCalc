import 'package:calculator/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

Future<void> showCustomDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String positiveButtonText,
   String?  negativeButtonText,
  required VoidCallback onPositivePressed,
   VoidCallback? onNegativePressed,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: AppStyles.style18().copyWith(
                color: Colors.black,
              ),
        ),
        content: Text(content,style: AppStyles.style18().copyWith(
                color: Colors.black,
              ),),
        actions: <Widget>[
          TextButton(
            onPressed: onNegativePressed,
            child: Text(
              negativeButtonText??"",
              style: AppStyles.style18().copyWith(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            
            onPressed: onPositivePressed,
            child: Text(
              positiveButtonText,
              style: AppStyles.style18().copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
