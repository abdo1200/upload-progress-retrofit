import 'package:auto_route/auto_route.dart';
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
        Container(
            padding: const EdgeInsets.all(40),
            color: AppColors.current.primaryColor,
            child: const Text('data')),
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
              if (state is ImageLoading) {
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      decoration: BoxDecoration(
                          color: AppColors.current.primaryTextColor
                              .withOpacity(.3),
                          borderRadius: BorderRadius.circular(10)),
                      width: width(context) * .8,
                      height: 30,
                    ),
                    AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(seconds: 1),
                      decoration: BoxDecoration(
                          color: AppColors.current.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: (width(context) * .8) * (state.sent / state.total),
                      height: 30,
                      child: Text(
                        "${((state.sent / state.total) * 100).toInt()}%",
                        style: AppTextStyles.s15White(),
                      ),
                    ),
                  ],
                );
                // Text(
                //     ((state.sent / state.total) * 100).toInt().toString());
                //     CircularPercentIndicator(
                //   radius: 60.0,
                //   lineWidth: 5.0,
                //   percent: state.sent / state.total,
                //   center:
                //       Text("${((state.sent / state.total) * 100).toInt()}%"),
                //   progressColor: Colors.green,
                // );
              }
              return ElevatedButton(
                child: const Text('login'),
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
