import 'package:progress/resource/styles/app_colors.dart';
import 'package:progress/resource/styles/app_text_styles.dart';
import 'package:progress/src/core/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SussesDialog extends StatelessWidget {
  const SussesDialog(
      {Key? key,
      this.titleMessage,
      this.bodyMessage,
      this.onClick,
      this.btnMessage})
      : super(key: key);
  final String? titleMessage;
  final String? bodyMessage;
  final String? btnMessage;
  final GestureTapCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: AppColors.current.witheColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    // SizedBox(
                    //     width: double.infinity,
                    //     height: 120,
                    //     child: Lottie.asset(Assets.images.celebration)),
                    // Container(
                    //     height: 130,
                    //     width: double.infinity,
                    //     alignment: Alignment.center,
                    //     child: SizedBox(
                    //         height: 50,
                    //         width: double.infinity,
                    //         child: SvgPicture.asset(
                    //           Assets.images.logoAr,
                    //           fit: BoxFit.fitHeight,
                    //         ))),
                    Container(
                      height: 160,
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        children: [
                          if ((titleMessage ?? "").isNotEmpty)
                            Text(
                              titleMessage ?? "",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s17Primary(),
                            ),
                          if ((bodyMessage ?? "").isNotEmpty)
                            Text(
                              bodyMessage ?? "",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s15Secondary(),
                            ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Align(
                    //       alignment: AlignmentDirectional.topEnd,
                    //       child: SvgPicture.asset(Assets.images.close)),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                customButtonSmall(btnMessage ?? 'S.current.continue_button',
                    () {
                  onClick?.call();
                  Navigator.pop(context);
                })
              ],
            ),
          )),
    );
  }
}
