import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress/features/auth/domain/entities/upload_files_request.dart';
import 'package:progress/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:progress/features/auth/domain/usecases/upload.dart';

part 'sign_state.dart';

@injectable
class SignCubit extends Cubit<SignState> {
  final LoginUseCase loginUseCase;
  final UploadUseCase _uploadFileUseCase;
  SignCubit(this.loginUseCase, this._uploadFileUseCase) : super(SignInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool useAgree = false;

  Future<void> toOtp() async {
    // emit(SignLoading(type: 1));
    // var data =
    //     await loginUseCase.call(userName: 'kminchelle', password: '0lelplR');
    // data.fold((failure) {
    //   print(failure.message);
    //   emit(SignError(failure.message));
    // }, (response) {
    //   print(response.firstName);
    //   emit(OtpStep());
    // });
    emit(OtpStep());
  }

  void toLogin() {
    emit(SignLoaded(step: 3));
  }

  List<dynamic> images = [];

  List<File> imagesPicked = [];
  List<Progress> uploadProgress = [];

  int imageUploadedCount = 0;

  Future pickImage({bool newValues = false, path = 'flats'}) async {
    try {
      emit(SignLoading(type: 1));

      final image = await ImagePicker().pickMultiImage();
      if (image.isEmpty) {
        emit(SignError('image empty'));
      }
      //  else if (image.length + images.length < 4) {
      //   emit(SignError('image length less than 4'));
      // }
      else {
        imagesPicked = [];
        for (var element in image) {
          imagesPicked.add(File(element.path));
        }
        imageUploadedCount = 0;
        images = imagesPicked.map((e) => e).toList();
        emit(SignLoading(type: 1));
        uploadProgress = [];

        var data = imagesPicked
            .map((e) async => await uploadImage(file: e, path: path))
            .toList();
        // for (int i = 0; i < imagesPicked.length; i++){
        //   await uploadImage(file: imagesPicked[i], path: path);
        // }
        await Future.wait(data);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      emit(SignInitial());
    }
  }

  Future<void> uploadImage({required File file, path = 'flats'}) async {
    uploadProgress.add(Progress(file: file, sent: 0, total: 1));
    emit(ImageLoading());
    var dataState = await _uploadFileUseCase(
      params: UploadFilesRequest(
        image: [file],
        path: path,
      ),
      onSendProgress: (sent, total) {
        uploadProgress.singleWhere((element) => element.file == file).sent =
            sent - (sent * (1 / 3)).toInt();
        uploadProgress.singleWhere((element) => element.file == file).total =
            total;

        emit(ImageLoading());
      },
    );
    dataState.fold((failure) {
      print(failure.message);
      emit(SignError(failure.message));
    }, (response) {
      uploadProgress.singleWhere((element) => element.file == file).sent =
          uploadProgress.singleWhere((element) => element.file == file).total -
              10;
      emit(ImageLoading());
      Timer.periodic(const Duration(seconds: 2), (timer) {
        uploadProgress.singleWhere((element) => element.file == file).sent =
            uploadProgress.singleWhere((element) => element.file == file).total;
        emit(ImageLoading());
        timer.cancel();
      });

      print(response.files);
    });
  }
}

class Progress {
  File file;
  int sent;
  int total;
  Progress({required this.file, required this.sent, required this.total});
}
