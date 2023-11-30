import 'package:progress/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resource/styles/app_colors.dart';

Widget customButton(String title, VoidCallback onPressed, {Color? color}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(12.w),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(15.w)),
        backgroundColor:
            MaterialStateProperty.all(color ?? AppColors.current.primaryColor)),
    child: Text(
      title,
      style: TextStyle(fontSize: 15.sp, color: Colors.white),
    ),
  );
}

Widget customButtonSmall(String title, VoidCallback onPressed, {Color? color}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h)),
        backgroundColor:
            MaterialStateProperty.all(color ?? AppColors.current.primaryColor)),
    child: Text(
      title,
      style: TextStyle(fontSize: 13.sp, color: Colors.white),
    ),
  );
}

Widget customButton13(String title, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(50.w),
          ),
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h)),
        backgroundColor:
            MaterialStateProperty.all(AppColors.current.primaryColor)),
    child: Text(
      title,
      style: AppTextStyles.s13AppSecondary(),
    ),
  );
}
