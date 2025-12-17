
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_detail.dart';

part 'upload_data.freezed.dart';
part 'upload_data.g.dart';

@freezed
abstract class UploadData with _$UploadData {
  const factory UploadData({
    required String id,
    required String title,
    @JsonKey(name: 'url_viewer') required String urlViewer,
    required String url,
    @JsonKey(name: 'display_url') required String displayUrl,

    required int width,
    required int height,
    required int size,
    required int time,
    required int expiration,

    required ImageDetail image,
    required ImageDetail thumb,
    required ImageDetail medium,
    @JsonKey(name: 'delete_url') required String deleteUrl,
  }) = _UploadData;

  factory UploadData.fromJson(Map<String, dynamic> json) =>
      _$UploadDataFromJson(json);
}