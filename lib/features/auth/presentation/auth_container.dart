import 'package:auto_route/auto_route.dart';
import 'package:progress/features/auth/presentation/bloc/sign_cubit.dart';
import 'package:progress/src/app/bloc/app_bloc.dart';
import 'package:progress/src/core/widget/dialogs/call_dialog.dart';
import 'package:progress/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().prefs.setUserModeString("user");
    return BlocProvider<SignCubit>(
      create: (context) => getIt<SignCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<SignCubit, SignState>(
          listener: (context, state) {
            if (state is SignError) {
              CallDialog.showErrorDialog(context, state.message);
            }
          },
          child: const Scaffold(body: AutoRouter()),
        );
      }),
    );
  }
}
