import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:progress/features/auth/data/remote/data_sources/auth_api_service.dart';
import 'package:progress/features/auth/data/remote/models/login_response.dart';
import 'package:progress/features/auth/data/remote/models/upload_file_response.dart';
import 'package:progress/features/auth/domain/entities/upload_files_request.dart';
import 'package:progress/features/auth/domain/repo/auth_repo.dart';
import 'package:progress/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  int? sent;
  int? total;
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<Either<Failure, LoginResponse>> userLogin(
      {String? username, String? password}) async {
    try {
      final httpResponse =
          await _authApiService.login(username: username, password: password);
      // httpResponse.response.statusCode = HttpStatus.ok;
      // httpResponse.data.data = LoginResponse(firstName: 'abdo');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data.data);
      } else {
        return left(ServerFailure.fromResponse(
            httpResponse.response.statusCode!,
            response: httpResponse.data));
      }
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServerFailure.fromDiorError(e));
      // }
      return left(ServerFailure('network error'));
    }
  }

  @override
  Future<Either<Failure, UploadFileResponse>> uploadGoldenFile(
      UploadFilesRequest request, ProgressCallback? onSendProgress) async {
    try {
      final multipartFiles = <MultipartFile>[];

      for (final file in request.image!) {
        final fileBytes = await file.readAsBytes();
        final multipartFile = MultipartFile.fromBytes(
          fileBytes,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'),
        );
        multipartFiles.add(multipartFile);
      }

      final httpResponse = await _authApiService.uploadGoldenFile(
          path: request.path!,
          image: multipartFiles,
          onSendProgress: onSendProgress);

      // httpResponse.response.statusCode = HttpStatus.ok;
      // httpResponse.data.data = LoginResponse(firstName: 'abdo');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data.data);
      } else {
        return left(ServerFailure.fromResponse(
            httpResponse.response.statusCode!,
            response: httpResponse.data));
      }
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServerFailure.fromDiorError(e));
      // }
      return left(ServerFailure('network error'));
    }
  }
}
