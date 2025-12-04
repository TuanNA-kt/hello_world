import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_detail.freezed.dart';
part 'image_detail.g.dart';
/// Reusable image variant model (`image`, `thumb`, `medium`)
@freezed
@freezed
abstract class ImageDetail with _$ImageDetail {
  const factory ImageDetail({
    required String filename,
    required String name,
    required String mime,
    required String extension,
    required String url,
  }) = _ImageDetail;

  factory ImageDetail.fromJson(Map<String, dynamic> json) =>
      _$ImageDetailFromJson(json);
}