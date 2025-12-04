import 'dart:io';

import 'package:api_client/src/api_client.dart';
import 'package:dio/dio.dart';

import 'model/upload_response.dart';

class UploadService {
  final ApiClient _apiClient;
  final String _apiKey;

  UploadService({required ApiClient apiClient, required String apiKey}) : _apiClient = apiClient, _apiKey = apiKey;

  Future<UploadResponse> uploadImage({
    required File imageFile,
    String? name,
    int? expirationSeconds,
  }) async {
    final multipartFile = await MultipartFile.fromFile(
      imageFile.path,
      filename: name ?? imageFile.path.split('/').last,
    );

    return await _apiClient.uploadImage(
      apiKey: _apiKey,
      imageFile: multipartFile,
      fileName: name,
      expirationSeconds: expirationSeconds,
    );
  }
}