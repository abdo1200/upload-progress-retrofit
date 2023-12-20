part of 'sign_cubit.dart';

abstract class SignState {
  const SignState();
}

class SignInitial extends SignState {}

class SignLoading extends SignState {
  final int type;
  SignLoading({required this.type});
}

class ImageLoading extends SignState {
  ImageLoading();
}

class SignLoaded extends SignState {
  final int step;
  SignLoaded({required this.step});
}

class OtpStep extends SignState {}

class SignError extends SignState {
  final String message;
  SignError(this.message);
}
