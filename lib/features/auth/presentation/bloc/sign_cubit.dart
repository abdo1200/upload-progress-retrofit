import 'dart:io';

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

  List<String> images = [];

  List<File> imagesPicked = [];
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
        imageUploadedCount = imagesPicked.length;

        var data = imagesPicked
            .map((e) async => await uploadImage(file: e, path: path))
            .toList();
        await Future.wait(data);
      }
      imageUploadedCount = 0;
      emit(SignInitial());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      emit(SignInitial());
    }
  }

  String uploadProgress = "";

  Future<void> uploadImage({required File file, path = 'flats'}) async {
    var dataState = await _uploadFileUseCase(
      params: UploadFilesRequest(
        image: [file],
        path: path,
      ),
      onSendProgress: (sent, total) {
        emit(ImageLoading(sent: sent, total: total * imageUploadedCount));
      },
    );
    dataState.fold((failure) {
      print(failure.message);
      emit(SignError(failure.message));
    }, (response) {
      print(response.files);
      imageUploadedCount--;
    });
  }
}
