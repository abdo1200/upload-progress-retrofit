import 'package:progress/resource/styles/app_colors.dart';
import 'package:progress/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    color: AppColors.current.witheColor,
                  ),
                  child: Row(
                    children: [
                      // SvgPicture.asset(Assets.images.errorIcon),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Text(
                          message,
                          style: AppTextStyles.s14Primary(),
                          softWrap: true,
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.clear),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
    );
    // );
  }
}
