
import 'package:api_client/src/model/upload_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response.freezed.dart';
part 'upload_response.g.dart';

/// Root response
@freezed
abstract class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    required UploadData data,
    required bool success,
    required int status,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);
}