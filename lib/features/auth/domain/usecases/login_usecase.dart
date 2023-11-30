import 'dart:ffi';

import 'package:progress/features/auth/data/remote/models/login_response.dart';
import 'package:progress/features/auth/domain/repo/auth_repo.dart';
import 'package:progress/src/core/errors/failure.dart';
import 'package:progress/src/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends UseCase<LoginResponse, Void?> {
  final AuthRepository _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<Either<Failure, LoginResponse>> call(
      {Void? param, String? userName, String? password}) async {
    return await _authRepo.userLogin(username: userName!, password: password!);
  }
}
