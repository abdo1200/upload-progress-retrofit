// import 'dart:math';

// import 'package:progress/resource/styles/app_text_styles.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:golden_host/resource/generated/assets.gen.dart';
// import 'package:golden_host/resource/styles/app_text_styles.dart';
// import 'package:golden_host/resource/styles/colors.dart';
// import 'package:golden_host/src/app/bloc/app_bloc.dart';
// import 'package:golden_host/src/generated/l10n.dart';

// import '../../../../resource/styles/app_colors.dart';
// import '../../validation/pattern.dart';

// class TextFiledCustom extends StatefulWidget {
//   final String title;

//   TextInputAction? textInputAction = TextInputAction.done;
//   bool? isPassword = false;
//   GestureTapCallback? onClick;
//   bool? isRequired = true;
//   bool? dirEnd = true;
//   bool? isRequiredTitle = true;
//   bool? isNumber = false;
//   TextInputType? textInputType = TextInputType.text;
//   String? hintText = "";
//   int? length;
//   double? border;
//   String? pattern = anyPattern;
//   String? hint;
//   String? errorMessage;
//   String? emptyMessage;
//   String? countryCode;
//   TextEditingController? textController;
//   TextEditingController? countryController;
//   String? icon;
//   int? lines = 1;
//   bool passVisibility = false;
//   bool? isEnable = true;
//   bool? isEditable = true;
//   bool? isSelected = false;
//   bool? isDatePicker = false;
//   Function(String)? onChanged;

//   TextFiledCustom(
//       {Key? key,
//       required this.title,
//       this.textInputAction,
//       this.isPassword,
//       this.isRequired,
//       this.countryCode,
//       this.dirEnd,
//       this.isRequiredTitle,
//       this.isNumber,
//       this.textInputType,
//       this.hint,
//       this.hintText,
//       this.length,
//       this.pattern,
//       this.errorMessage,
//       this.emptyMessage,
//       this.textController,
//       this.countryController,
//       this.icon,
//       this.lines,
//       this.isEnable,
//       this.isEditable,
//       this.onClick,
//       this.border,
//       this.isDatePicker,
//       this.isSelected,
//       this.onChanged})
//       : super(key: key);

//   @override
//   State<TextFiledCustom> createState() => _TextFiledCustomState();
// }

// class _TextFiledCustomState extends State<TextFiledCustom> {
//   var borderRadius = 12.w;
//   var borderWidth = 2.0;
//   Country? country;
//   RegExp exp = RegExp("[a-zA-Z]");
//   TextDirection textDirection = TextDirection.rtl;

//   @override
//   void initState() {
//     super.initState();
//     borderRadius = widget.border ?? 12.w;

//     country = Country.parse(widget.countryCode ?? "LY");
//     if (widget.countryController != null) {
//       widget.countryController?.text = "+${country?.phoneCode}";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var isArabic = BlocProvider.of<AppBloc>(context).languageCode;
//     var pass = widget.isPassword ?? false;
//     widget.dirEnd = (isArabic == "ar") ? true : false;

//     return InkWell(
//       onTap: (widget.onClick != null && !(widget.isEnable ?? true))
//           ? widget.onClick
//           : null,
//       child: Container(
//         margin:
//             EdgeInsets.symmetric(vertical: borderRadius == 8.w ? 10.w : 0.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // SizedBox(
//             //   height: 5,
//             // ),
//             Visibility(
//               visible: widget.isRequiredTitle ?? true,
//               child: Row(
//                 children: [
//                   widget.icon != null
//                       ? SvgPicture.asset(
//                           widget.icon ?? "",
//                           width: 20.w,
//                           height: 20.w,
//                           color: AppColors.current.primaryTextColor,
//                         )
//                       : const SizedBox(),
//                   widget.icon != null
//                       ? const SizedBox(
//                           width: 4,
//                         )
//                       : const SizedBox(),
//                   Text(
//                     widget.title,
//                     style: AppTextStyles.s11Secondary(),
//                   ),
//                 ],
//               ),
//             ),
//             Visibility(
//               visible: widget.isRequiredTitle ?? true,
//               child: const SizedBox(
//                 height: 10,
//               ),
//             ),

//             Directionality(
//               textDirection: TextDirection.ltr,
//               child: IntrinsicHeight(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,

//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     widget.countryController != null
//                         ? Expanded(
//                             flex: 2,
//                             child: Directionality(
//                                 textDirection: widget.dirEnd!
//                                     ? TextDirection.rtl
//                                     : TextDirection.ltr,
//                                 child: TextFormField(
//                                     enabled: false,
//                                     maxLines: 1,
//                                     minLines: 1,
//                                     controller: widget.countryController,
//                                     onTapOutside: (event) {
//                                       FocusManager.instance.primaryFocus
//                                           ?.unfocus();
//                                     },
//                                     style: TextStyle(
//                                         fontFamily: "Co",
//                                         fontSize: 12.sp,
//                                         color:
//                                             AppColors.current.primaryTextColor),
//                                     decoration: InputDecoration(
//                                       // hintText: "",
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 5.w, vertical: 10.h),
//                                       prefixIconConstraints: BoxConstraints(
//                                           minWidth: 30.w, maxHeight: 30.w),
//                                       suffixIconConstraints: BoxConstraints(
//                                           minWidth: 30.w, maxHeight: 30.w),
//                                       suffixIcon: Container(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 10.w,
//                                           ),
//                                           child: Text(country?.flagEmoji ?? "",
//                                               style: const TextStyle(
//                                                   fontSize: 20))),
//                                       fillColor: Colors.transparent,
//                                       filled: true,
//                                       border: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: .5,
//                                               color: AppColors
//                                                   .current.secondaryTextColor),
//                                           borderRadius: BorderRadius.circular(
//                                               borderRadius)),
//                                       disabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: .5,
//                                               color: AppColors
//                                                   .current.secondaryTextColor),
//                                           borderRadius: BorderRadius.circular(
//                                               borderRadius)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: .5,
//                                               color: AppColors
//                                                   .current.primaryColor),
//                                           borderRadius: BorderRadius.circular(
//                                               borderRadius)),
//                                       errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: .5,
//                                               color: AppColors
//                                                   .current.secondaryTextColor),
//                                           borderRadius: BorderRadius.circular(
//                                               borderRadius)),
//                                     ))),
//                           )
//                         : const SizedBox(),
//                     widget.countryController != null
//                         ? SizedBox(
//                             width: 8.w,
//                           )
//                         : const SizedBox(),
//                     Expanded(
//                       flex: 6,
//                       child: Directionality(
//                         textDirection: textDirection,
//                         child: TextFormField(
//                             mouseCursor: MouseCursor.defer,
//                             enabled: widget.isEnable,
//                             onTapOutside: (event) {
//                               FocusManager.instance.primaryFocus?.unfocus();
//                             },
//                             textInputAction: widget.textInputAction,
//                             cursorColor: AppColors.current.primaryTextColor,
//                             textDirection: textDirection,
//                             textAlign: widget.dirEnd! &&
//                                     !(widget.isDatePicker ?? false) &&
//                                     widget.countryController == null
//                                 ? TextAlign.right
//                                 : TextAlign.left,
//                             maxLines: widget.lines ?? 1,
//                             minLines: widget.lines ?? 1,
//                             controller: widget.textController,
//                             maxLength: widget.length,
//                             style: TextStyle(
//                                 fontFamily: "Co",
//                                 fontSize: 12.sp,
//                                 color: AppColors.current.primaryTextColor),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(widget.length),
//                               if (widget.pattern == postiveNumber)
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp(widget.pattern!))
//                             ],
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 if (widget.isRequired!) {
//                                   return "\u26A0 ${widget.emptyMessage}";
//                                 }
//                               } else if (!RegExp(widget.pattern!)
//                                   .hasMatch(value)) {
//                                 return "\u26A0 ${widget.errorMessage}";
//                               } else {
//                                 return null;
//                               }
//                               return null;
//                             },
//                             autovalidateMode: AutovalidateMode.disabled,
//                             obscureText: pass && !widget.passVisibility,
//                             keyboardType: widget.textInputType,
//                             onChanged: (val) {
//                               if (widget.onChanged != null) {
//                                 widget.onChanged!(val);
//                               }
//                               if (val != '') {
//                                 if (exp.hasMatch(
//                                         val.substring(val.length - 1)) &&
//                                     val.substring(val.length - 1) != " ") {
//                                   setState(() {
//                                     textDirection = TextDirection.ltr;
//                                   });
//                                 } else if (val.substring(val.length - 1) !=
//                                         " " &&
//                                     !exp.hasMatch(
//                                         val.substring(val.length - 1))) {
//                                   setState(() {
//                                     textDirection = TextDirection.rtl;
//                                   });
//                                 }
//                               }
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 10.w, vertical: 10.h),
//                               prefixIconConstraints: BoxConstraints(
//                                   minWidth: 30.w, maxHeight: 30.w),
//                               suffixIconConstraints: BoxConstraints(
//                                   minWidth: 30.w, maxHeight: 30.w),
//                               prefixIcon: widget.isDatePicker ?? false
//                                   ? InkWell(
//                                       onTap: () {},
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w),
//                                         child: SvgPicture.asset(
//                                             Assets.images.calendar),
//                                       ),
//                                     )
//                                   : null,
//                               suffixIcon: widget.onClick == null
//                                   ? widget.isPassword ?? false
//                                       ? InkWell(
//                                           onTap: () {
//                                             widget.passVisibility =
//                                                 !widget.passVisibility;
//                                             setState(() {});
//                                           },
//                                           child: SvgPicture.asset(
//                                             Assets.images.map,
//                                             color: widget.passVisibility
//                                                 ? AppColors.current.primaryColor
//                                                 : AppColors
//                                                     .current.primaryTextColor,
//                                           ),
//                                         )
//                                       : null
//                                   : !(widget.isDatePicker ?? false)
//                                       ? InkWell(
//                                           onTap: widget.onClick,
//                                           child: widget.isSelected ?? false
//                                               ? SvgPicture.asset(
//                                                   Assets.images.searchTimeArrow,
//                                                   color: AppColors
//                                                       .current.primaryTextColor,
//                                                   matchTextDirection: true,
//                                                 )
//                                               : Padding(
//                                                   padding: const EdgeInsets
//                                                           .symmetric(
//                                                       horizontal: 8.0),
//                                                   child: Text(S.current.edit,
//                                                       style: AppTextStyles
//                                                           .s11AppPrimary(
//                                                               decoration:
//                                                                   TextDecoration
//                                                                       .underline)),
//                                                 ),
//                                         )
//                                       : null,
//                               hintText: widget.hintText,
//                               hintStyle: TextStyle(
//                                   fontSize: 15.sp,
//                                   fontFamily: "Co",
//                                   color: AppColors.current.secondaryTextColor),
//                               errorStyle:
//                                   TextStyle(color: darkRed, fontSize: 10.sp),
//                               fillColor: (widget.isEditable ?? true)
//                                   ? Colors.transparent
//                                   : AppColors.current.editTextColor,
//                               filled: true,
//                               // contentPadding: EdgeInsets.symmetric(
//                               //     horizontal: 12.w, vertical: 13.h),
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: .5,
//                                       color:
//                                           AppColors.current.secondaryTextColor),
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadius)),
//                               disabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: .5,
//                                       color:
//                                           AppColors.current.secondaryTextColor),
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadius)),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: .5,
//                                       color: AppColors.current.primaryColor),
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadius)),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: .5,
//                                       color:
//                                           AppColors.current.secondaryTextColor),
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadius)),
//                               errorBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: .5,
//                                       color:
//                                           AppColors.current.secondaryTextColor),
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadius)),
//                               // disabledBorder: OutlineInputBorder(
//                               //   // borderSide: BorderSide(
//                               //   //   color: AppColors.current.secondaryTextColor,
//                               //   // ),
//                               //   borderRadius: BorderRadius.circular(borderRadius),
//                               // ),
//                               // enabledBorder: OutlineInputBorder(
//                               //   // borderSide: BorderSide(
//                               //   //   color: AppColors.current.secondaryTextColor,
//                               //   // ),
//                               //   borderRadius: BorderRadius.circular(borderRadius),
//                               // ),
//                               // focusedBorder: OutlineInputBorder(
//                               //   borderSide: BorderSide(
//                               //       color: AppColors.current.primaryColor,
//                               //       width: borderWidth),
//                               //   borderRadius: BorderRadius.circular(borderRadius),
//                               // ),
//                               // errorBorder: OutlineInputBorder(
//                               //   borderSide:
//                               //       BorderSide(color: darkRed, width: borderWidth),
//                               //   borderRadius: BorderRadius.circular(borderRadius),
//                               // ),
//                               // focusedErrorBorder: OutlineInputBorder(
//                               //   borderSide:
//                               //       BorderSide(color: darkRed, width: borderWidth),
//                               //   borderRadius: BorderRadius.circular(borderRadius),
//                               // ),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomWidgets {
//   static Widget textField(String title,
//       {bool large_title = false,
//       TextInputAction textInputAction = TextInputAction.done,
//       bool isPassword = false,
//       bool isRequired = true,
//       bool dirEnd = true,
//       String isRequiredTitle = "",
//       bool isNumber = false,
//       TextInputType textInputType = TextInputType.text,
//       String hintText = "",
//       int? length,
//       String pattern = anyPattern,
//       String? hint,
//       String? errorMessage,
//       TextEditingController? textController,
//       String? icon,
//       int lines = 1}) {
//     var borderRadius = 8.w;
//     var borderWidth = 1.w;

//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               icon != null
//                   ? SvgPicture.asset(
//                       icon ?? "",
//                       width: 20.w,
//                       height: 20.w,
//                     )
//                   : const SizedBox(),
//               const SizedBox(
//                 width: 4,
//               ),
//               Text(
//                 title,
//                 style: AppTextStyles.s16Primary(),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//               textInputAction: textInputAction,
//               cursorColor: AppColors.current.primaryTextColor,
//               textDirection: dirEnd ? TextDirection.ltr : TextDirection.rtl,
//               textAlign: dirEnd ? TextAlign.right : TextAlign.left,
//               maxLines: lines,
//               minLines: lines,
//               controller: textController,
//               onTapOutside: (event) {
//                 FocusManager.instance.primaryFocus?.unfocus();
//               },
//               maxLength: length,
//               style: AppTextStyles.s13Primary(),
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(length),
//               ],
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   if (isRequired) return "\u26A0 $errorMessage";
//                 } else if (!RegExp(pattern).hasMatch(value)) {
//                   return "\u26A0 $errorMessage";
//                 } else {
//                   return null;
//                 }
//                 return null;
//               },
//               autovalidateMode: AutovalidateMode.disabled,
//               obscureText: isPassword,
//               keyboardType: textInputType,
//               onChanged: (text) {},
//               decoration: InputDecoration(
//                 suffixIcon: isPassword
//                     ? InkWell(
//                         onTap: () {},
//                         child: Padding(
//                           padding: EdgeInsets.all(12.w),
//                           child: SvgPicture.asset(
//                             Assets.images.map,
//                             width: 20.w,
//                             height: 20.w,
//                           ),
//                         ),
//                       )
//                     : null,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                     fontSize: 15.sp, color: AppColors.current.primaryTextColor),
//                 errorStyle: TextStyle(color: darkRed, fontSize: 10.sp),
//                 fillColor: Colors.transparent,
//                 filled: true,
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.current.secondaryTextColor,
//                   ),
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       color: AppColors.current.primaryColor,
//                       width: borderWidth),
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: darkRed, width: borderWidth),
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: darkRed, width: borderWidth),
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }

//   static Widget selectedFiled(String title, String des, bool isArabic,
//       {String? icon}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Visibility(
//                 visible: icon != null,
//                 child: SvgPicture.asset(
//                   "assets/images/$icon.svg",
//                   color: AppColors.current.secondaryTextColor,
//                 ),
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w100,
//                     color: AppColors.current.primaryTextColor),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(5)),
//               color: AppColors.current.secondaryTextColor,
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
//             child: Row(
//               children: [
//                 Text(
//                   des,
//                   style: AppTextStyles.s11Primary(),
//                 ),
//                 const Spacer(),
//                 Transform.rotate(
//                     angle: isArabic ? 0 : 180 * pi / 180,
//                     child: SvgPicture.asset(
//                       "assets/images/arrow.svg",
//                       color: AppColors.current.secondaryTextColor,
//                     ))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget setTextList(String fieldName, String fieldHint, String mText,
//     SvgPicture mIcon, VoidCallback? onIconPressed, bool status, isArabic) {
//   return GestureDetector(
//     onTap: onIconPressed,
//     child: Container(
//       child: Padding(
//           padding: const EdgeInsets.only(top: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Visibility(
//                 visible: status,
//                 child: Text(
//                   fieldName,
//                   style: TextStyle(
//                       fontSize: 11.sp,
//                       fontWeight: FontWeight.w100,
//                       color: AppColors.current.primaryTextColor),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: AppColors.current.secondaryTextColor,
//                   borderRadius: const BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                         child: Padding(
//                       padding: const EdgeInsets.only(left: 14, right: 14),
//                       child: Text(
//                         mText.isNotEmpty ? mText : fieldHint,
//                         style: AppTextStyles.s10Primary(),
//                       ),
//                     )),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: GestureDetector(
//                         onTap: onIconPressed,
//                         child: Transform.rotate(
//                             angle: isArabic ? 0 : 180 * pi / 180, child: mIcon),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )),
//     ),
//   );
// }
