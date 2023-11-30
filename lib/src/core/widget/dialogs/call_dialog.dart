import 'package:progress/resource/styles/app_colors.dart';
import 'package:progress/src/core/widget/dialogs/confirm_dialog.dart';
import 'package:progress/src/core/widget/dialogs/susses_dialog.dart';
import 'package:flutter/material.dart';

import 'error_dialog.dart';

class CallDialog {
  static void showErrorDialog(BuildContext context, String msg) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 500),
        barrierColor: AppColors.current.dialogColor,
        transitionBuilder: (context, a1, a2, widget) {
          const begin = Offset(0.0, -1.0);
          const end = Offset.zero;
          return SlideTransition(
              // scale: a1.value,
              position: Tween(begin: begin, end: end).animate(a1),
              child:
                  Opacity(opacity: a1.value, child: ErrorDialog(message: msg)));
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        });
  }

  static void showSussesDialog(
    BuildContext context, {
    String? titleMassage,
    String? bodyMassage,
    String? btnMessage,
    GestureTapCallback? onClick,
  }) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 500),
        barrierColor: AppColors.current.dialogColor,
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
              scale: a1,
              child: Opacity(
                  opacity: a1.value,
                  child: SussesDialog(
                    titleMessage: titleMassage,
                    bodyMessage: bodyMassage,
                    onClick: onClick,
                    btnMessage: btnMessage,
                  )));
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        });
  }

  static void showBottomSussesDialog(
    BuildContext context, {
    String? titleMassage,
    String? bodyMassage,
    String? btnMessage,
    GestureTapCallback? onClick,
  }) {
    showModalBottomSheet(
      backgroundColor: AppColors.current.witheColor,
      context: context,
      builder: (builder) => Wrap(
        children: [
          SussesDialog(
            titleMessage: titleMassage,
            bodyMessage: bodyMassage,
            onClick: onClick,
            btnMessage: btnMessage,
          )
        ],
      ),
    );
  }

  static void showConfirmDialog(
    BuildContext context, {
    String? titleMassage,
    String? bodyMassage,
    String? actionTitle,
    GestureTapCallback? onClick,
  }) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 500),
        barrierColor: AppColors.current.dialogColor,
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
              scale: a1,
              child: Opacity(
                  opacity: a1.value,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ConfirmDialog(
                      titleMessage: titleMassage,
                      bodyMessage: bodyMassage,
                      onClick: onClick,
                    ),
                  )));
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        });
  }

  static void showBottomConfirmDialog(
    BuildContext context, {
    String? titleMassage,
    String? bodyMassage,
    String? actionTitle,
    GestureTapCallback? onClick,
  }) {
    showModalBottomSheet(
        // backgroundColor: AppColors.current.witheColor,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) => Wrap(children: [
              ConfirmDialog(
                titleMessage: titleMassage,
                bodyMessage: bodyMassage,
                onClick: onClick,
                actionTitle: actionTitle,
              )
            ]));
  }
}
