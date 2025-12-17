import 'dart:io';

import 'package:api_client/rest_client.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:api_client/models.dart';

class MediaRepository {
  final ChatRemoteDataSource _remoteDataSource;
  final ApiService _apiService;
  final ImagePicker _imagePicker;

  MediaRepository({
    required ChatRemoteDataSource remoteDataSource,
    required ApiService apiService,
    required ImagePicker imagePicker,
  }) : _remoteDataSource = remoteDataSource,
       _apiService = apiService,
       _imagePicker = imagePicker;

  Future<String?> pickImageFromGallery() async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    return file?.path;
  }

  Future<String?> uploadImageToCloud(String filePath) async {
    try {
      final UploadResponse response = await _apiService.uploadImage(imageFile: File(filePath));
      print("Response: ${response.data}");
      if(response.success == true && response.status == 200) {
        return response.data.url;
      } else {
        throw Exception('upload image error');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
