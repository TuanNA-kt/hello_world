// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageDetail _$ImageDetailFromJson(Map<String, dynamic> json) => _ImageDetail(
  filename: json['filename'] as String,
  name: json['name'] as String,
  mime: json['mime'] as String,
  extension: json['extension'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$ImageDetailToJson(_ImageDetail instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'name': instance.name,
      'mime': instance.mime,
      'extension': instance.extension,
      'url': instance.url,
    };
