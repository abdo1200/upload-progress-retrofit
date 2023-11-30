// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthApiService implements AuthApiService {
  _AuthApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://goldenhost.co/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<RemoteResponse<LoginResponse>>> login({
    String? username,
    String? password,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'username': username,
      r'password': password,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<RemoteResponse<LoginResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteResponse<LoginResponse>.fromJson(
      _result.data!,
      (json) => LoginResponse.fromJson(json),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<RemoteResponse<UploadFileResponse>>> uploadGoldenFile({
    required String path,
    required List<MultipartFile> image,
    void Function(int, int)? onSendProgress,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'path',
      path,
    ));
    _data.files.addAll(image.map((i) => MapEntry('image[]', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<RemoteResponse<UploadFileResponse>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
                .compose(
                  _dio.options,
                  '/upload',
                  queryParameters: queryParameters,
                  data: _data,
                  onSendProgress: onSendProgress,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteResponse<UploadFileResponse>.fromJson(
      _result.data!,
      (json) => UploadFileResponse.fromJson(json),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
