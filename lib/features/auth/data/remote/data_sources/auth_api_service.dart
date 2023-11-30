import 'package:progress/features/auth/data/remote/models/login_response.dart';
import 'package:progress/features/auth/data/remote/models/remote_response.dart';
import 'package:dio/dio.dart';
import 'package:progress/features/auth/data/remote/models/upload_file_response.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: 'https://goldenhost.co/api/v2/')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('auth/login')
  Future<HttpResponse<RemoteResponse<LoginResponse>>> login({
    @Query("username") String? username,
    @Query("password") String? password,
  });

  @MultiPart()
  @POST("/upload")
  Future<HttpResponse<RemoteResponse<UploadFileResponse>>> uploadGoldenFile(
      {@Part() required String path,
      @Part(name: "image[]") required List<MultipartFile> image,
      @SendProgress() ProgressCallback? onSendProgress});
}
