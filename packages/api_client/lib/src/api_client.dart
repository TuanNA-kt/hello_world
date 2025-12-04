import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/upload_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.imgbb.com/1/')
abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/upload')
  @MultiPart()
  Future<UploadResponse> uploadImage({
      @Part(name: "key") required String apiKey,
      @Part(name: "image") required MultipartFile imageFile,
      @Part(name: "name") String? fileName,
      @Part(name: "expiration") int? expirationSeconds}
      );
}
