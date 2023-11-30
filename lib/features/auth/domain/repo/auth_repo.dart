import 'package:dio/dio.dart';
import 'package:progress/features/auth/data/remote/models/login_response.dart';
import 'package:progress/features/auth/data/remote/models/upload_file_response.dart';
import 'package:progress/features/auth/domain/entities/upload_files_request.dart';
import 'package:progress/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> userLogin(
      {String username, String password});
  Future<Either<Failure, UploadFileResponse>> uploadGoldenFile(
      UploadFilesRequest request, ProgressCallback? onSendProgress);
}
