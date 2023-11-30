// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:progress/features/auth/data/remote/data_sources/auth_api_service.dart'
    as _i11;
import 'package:progress/features/auth/data/repo/auth_repo_imp.dart' as _i13;
import 'package:progress/features/auth/domain/repo/auth_repo.dart' as _i12;
import 'package:progress/features/auth/domain/usecases/login_usecase.dart'
    as _i14;
import 'package:progress/features/auth/domain/usecases/upload.dart' as _i15;
import 'package:progress/features/auth/presentation/bloc/sign_cubit.dart'
    as _i16;
import 'package:progress/src/app/bloc/app_bloc.dart' as _i8;
import 'package:progress/src/core/navigation/routes/AppRouter.dart' as _i3;
import 'package:progress/src/core/network/access_token_interceptor.dart' as _i7;
import 'package:progress/src/core/network/auth_interceptor.dart' as _i9;
import 'package:progress/src/core/preferences/PreferencesHelper.dart' as _i5;
import 'package:progress/src/core/preferences/Prefs.dart' as _i6;
import 'package:progress/src/di/AppModule.dart' as _i17;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppRouter>(appModule.appRouter);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      appModule.currentPlatform,
      instanceName: 'currentPlatform',
    );
    gh.factory<_i5.PreferencesHelper>(
        () => appModule.getPreferencesHelper(gh<_i4.SharedPreferences>()));
    gh.factory<_i6.Prefs>(() => _i6.Prefs(gh<_i5.PreferencesHelper>()));
    await gh.singletonAsync<String>(
      () => appModule.getLanguageCode(gh<_i6.Prefs>()),
      instanceName: 'languageCode',
      preResolve: true,
    );
    gh.factory<_i7.AccessTokenInterceptor>(
        () => _i7.AccessTokenInterceptor(gh<_i6.Prefs>()));
    gh.factory<_i8.AppBloc>(() => _i8.AppBloc(
          prefs: gh<_i6.Prefs>(),
          languageCode: gh<String>(),
          modeThem: gh<String>(),
          hasOrder: gh<bool>(),
        ));
    gh.factory<_i9.AuthInterceptor>(() => _i9.AuthInterceptor(
          gh<_i6.Prefs>(),
          gh<_i3.AppRouter>(),
        ));
    await gh.factoryAsync<_i10.Dio>(
      () => appModule.dio(
        gh<String>(instanceName: 'languageCode'),
        gh<_i7.AccessTokenInterceptor>(),
        gh<_i9.AuthInterceptor>(),
      ),
      preResolve: true,
    );
    gh.factory<_i11.AuthApiService>(
        () => appModule.getAuthService(gh<_i10.Dio>()));
    gh.factory<_i12.AuthRepository>(
        () => _i13.AuthRepositoryImpl(gh<_i11.AuthApiService>()));
    gh.factory<_i14.LoginUseCase>(
        () => _i14.LoginUseCase(gh<_i12.AuthRepository>()));
    gh.factory<_i15.UploadUseCase>(
        () => _i15.UploadUseCase(gh<_i12.AuthRepository>()));
    gh.factory<_i16.SignCubit>(() => _i16.SignCubit(
          gh<_i14.LoginUseCase>(),
          gh<_i15.UploadUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i17.AppModule {}
