import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: 'https://api.imgbb.com/1')
abstract class RestClient {

    factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

    @POST('/upload')
    Future<>

}