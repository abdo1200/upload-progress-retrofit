import 'package:progress/features/auth/data/remote/data_sources/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/navigation/routes/AppRouter.dart';
import '../core/network/access_token_interceptor.dart';
import '../core/network/auth_interceptor.dart';
import '../core/network/logging_interceptor.dart';
import 'dart:io' show Platform;

import '../core/preferences/PreferencesHelper.dart';
import '../core/preferences/Prefs.dart';
import '../core/preferences/constants.dart'; //at the top

@module
abstract class AppModule {
  @preResolve
  Future<Dio> dio(
          @Named("languageCode") String languageCode,
          AccessTokenInterceptor accessTokenInterceptor,
          AuthInterceptor authInterceptor) async =>
      Dio()
        ..options.headers["X-SECRET-KEY"] = kApiKey
        ..options.headers['X-Language'] = languageCode
        ..options.headers['Accept'] = "application/json"
        ..options.headers['Content-Type'] = "application/json"
        ..options.connectTimeout =
            const Duration(milliseconds: Duration.millisecondsPerMinute)
        ..options.receiveTimeout =
            const Duration(milliseconds: Duration.millisecondsPerMinute)
        ..options.validateStatus = (status) {
          return status! <= 500;
        }
        ..interceptors.add(LoggingInterceptor())
        ..interceptors.add(accessTokenInterceptor)
        ..interceptors.add(authInterceptor);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  PreferencesHelper getPreferencesHelper(SharedPreferences prefs) =>
      PreferencesHelper(prefs);

  AuthApiService getAuthService(Dio dio) => AuthApiService(dio);

  // UserMainApiService getUserMainService(Dio dio) => UserMainApiService(dio);
  // VendorMainApiService getVendorMainService(Dio dio) =>
  //     VendorMainApiService(dio);
  // VendorSettingsApiService getVendorSettingsService(Dio dio) =>
  //     VendorSettingsApiService(dio);
  // UnitMainApiService getUnitApiService(Dio dio) => UnitMainApiService(dio);

  // ProfileApiService getProfileApiService(Dio dio) => ProfileApiService(dio);

  // ReservationrMainApiService getReservationsApiService(Dio dio) =>
  //     ReservationrMainApiService(dio);
  // PaymentApiService getPaymentApiService(Dio dio) => PaymentApiService(dio);

  // VendorFlatsMainApiService getVendorFlatsMainApiService(Dio dio) =>
  //     VendorFlatsMainApiService(dio);

  // @Singleton()
  // FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @Singleton()
  @Named("currentPlatform")
  String get currentPlatform => Platform.isAndroid ? "android" : "iphone";

  // @Singleton()
  // @preResolve
  // @Named("deviceId")
  // Future<String> get deviceId async => await PlatformDeviceId.getDeviceId ?? "";

  @Singleton()
  @preResolve
  @Named("languageCode")
  Future<String> getLanguageCode(Prefs pref) async => await pref.languageString;

  @Singleton()
  AppRouter get appRouter => AppRouter();
}
