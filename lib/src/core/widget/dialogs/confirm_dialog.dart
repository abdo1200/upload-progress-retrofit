import 'package:progress/resource/styles/app_colors.dart';
import 'package:progress/resource/styles/app_text_styles.dart';
import 'package:progress/src/core/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {Key? key,
      this.titleMessage,
      this.bodyMessage,
      this.onClick,
      this.actionTitle})
      : super(key: key);
  final String? titleMessage;
  final String? bodyMessage;
  final String? actionTitle;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.w),
                  topRight: Radius.circular(20.w)),
              color: AppColors.current.witheColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // InkWell(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: Align(
                //       alignment: AlignmentDirectional.topEnd,
                //       child: SvgPicture.asset(Assets.images.close)),
                // ),
                // SvgPicture.asset(Assets.images.triangleWarning),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  titleMessage ?? "",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s17Primary(),
                ),
                Text(
                  bodyMessage ?? "",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s15Secondary(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: customButtonSmall(actionTitle ?? '', () {
                        Navigator.pop(context);
                        if (onClick != null) {
                          onClick!();
                        }
                      }, color: AppColors.current.errorTextColor),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    // Expanded(
                    //   child: customButtonSmall(S.current.no, () {
                    //     Navigator.pop(context);
                    //   }, color: AppColors.current.secondaryTextColor),
                    // ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
