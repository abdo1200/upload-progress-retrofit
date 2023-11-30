import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../preferences/Prefs.dart';

@Injectable()
class AccessTokenInterceptor extends Interceptor {
  AccessTokenInterceptor(this._appPreferences);

  final Prefs _appPreferences;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _appPreferences.tokenString;
    final language = await _appPreferences.languageString;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      print(token);
    }
    if (language.isNotEmpty) {
      options.headers['X-Language'] = language;
    }

    handler.next(options);
  }
}
