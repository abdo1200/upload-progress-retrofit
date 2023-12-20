import 'package:auto_route/auto_route.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress/features/auth/presentation/bloc/sign_cubit.dart';
import 'package:progress/resource/styles/app_colors.dart';
import 'package:progress/resource/styles/app_text_styles.dart';
import 'package:progress/src/core/preferences/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignPage extends StatelessWidget {
  final singInFormKey = GlobalKey<FormState>();

  SignPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignCubit>(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Container(
        //     padding: const EdgeInsets.all(40),
        //     color: AppColors.current.primaryColor,
        //     child: const Text('data')),
        const SizedBox(height: 10),
        Hero(
          tag: 'test',
          child: BlocConsumer<SignCubit, SignState>(
            listener: (context, state) {
              if (state is OtpStep) {
                // context.router.push(OtpRoute());
              }
            },
            buildWhen: (ps, cs) =>
                cs is SignLoading && (cs.type == 1 || cs.type == 0) ||
                cs is SignError ||
                cs is ImageLoading ||
                cs is SignInitial,
            builder: (context, state) {
              if (state is SignLoading && state.type == 1) {
                return const CircularProgressIndicator();
              }

              return cubit.images.isNotEmpty
                  ? Column(
                      children: [
                        Wrap(
                            children: cubit.images.map((e) {
                          return SizedBox(
                            width: width(context) * .34,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      e,
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  if (cubit.uploadProgress
                                              .singleWhere((element) =>
                                                  element.file == e)
                                              .sent !=
                                          cubit.uploadProgress
                                              .singleWhere((element) =>
                                                  element.file == e)
                                              .total &&
                                      state is ImageLoading)
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColors
                                                .current.primaryTextColor
                                                .withOpacity(.5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: width(context) * .3,
                                        height: double.infinity,
                                      ),
                                    ),
                                  if (cubit.uploadProgress
                                              .singleWhere((element) =>
                                                  element.file == e)
                                              .sent !=
                                          cubit.uploadProgress
                                              .singleWhere((element) =>
                                                  element.file == e)
                                              .total &&
                                      state is ImageLoading)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: CircularPercentIndicator(
                                            radius: 20.0,
                                            lineWidth: 3.0,
                                            animationDuration: 2000,
                                            animateFromLastPercent: true,
                                            animation: true,
                                            percent: cubit.uploadProgress
                                                    .singleWhere((element) =>
                                                        element.file == e)
                                                    .sent /
                                                cubit.uploadProgress
                                                    .singleWhere((element) =>
                                                        element.file == e)
                                                    .total,
                                            progressColor: AppColors
                                                .current.secondaryColor,
                                          )
                                          // AnimatedContainer(
                                          //   alignment: Alignment.center,
                                          //   duration: const Duration(seconds: 2),
                                          //   decoration: BoxDecoration(
                                          //       color: AppColors
                                          //           .current.secondaryColor,
                                          //       borderRadius:
                                          //           BorderRadius.circular(10)),
                                          //   width: (width(context) * .25) *
                                          //       (cubit.uploadProgress
                                          //               .singleWhere((element) =>
                                          //                   element.file == e)
                                          //               .sent /
                                          //           cubit.uploadProgress
                                          //               .singleWhere((element) =>
                                          //                   element.file == e)
                                          //               .total),
                                          //   height: 10,
                                          // ),
                                          ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                      ],
                    )
                  : ElevatedButton(
                      child: Text(
                        'upload',
                        style: AppTextStyles.s17AppPrimary(),
                      ),
                      onPressed: () {
                        //cubit.toOtp();
                        cubit.pickImage();
                        //cubit.toOtp();
                      },
                    );
            },
          ),
        ),
      ]),
    );
  }
}
