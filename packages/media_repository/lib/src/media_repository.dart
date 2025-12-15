import 'dart:io';

import 'package:api_client/rest_client.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> uploadImageToCloud(String filePath) async {
    await _apiService.uploadImage(imageFile: File(filePath));
  }

}
