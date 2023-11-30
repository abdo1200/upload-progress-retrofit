import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:progress/features/auth/data/remote/models/upload_file_response.dart';
import 'package:progress/features/auth/domain/entities/upload_files_request.dart';
import 'package:progress/features/auth/domain/repo/auth_repo.dart';
import 'package:progress/src/core/errors/failure.dart';
import 'package:progress/src/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadUseCase extends UseCase<UploadFileResponse, Void?> {
  final AuthRepository _authRepo;

  UploadUseCase(this._authRepo);

  @override
  Future<Either<Failure, UploadFileResponse>> call(
      {Void? param,
      UploadFilesRequest? params,
      ProgressCallback? onSendProgress}) async {
    return await _authRepo.uploadGoldenFile(params!, onSendProgress);
  }
}
