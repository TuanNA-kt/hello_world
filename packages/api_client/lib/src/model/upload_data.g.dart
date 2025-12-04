// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadData _$UploadDataFromJson(Map<String, dynamic> json) => _UploadData(
  id: json['id'] as String,
  title: json['title'] as String,
  urlViewer: json['url_viewer'] as String,
  url: json['url'] as String,
  displayUrl: json['display_url'] as String,
  width: json['width'] as String,
  height: json['height'] as String,
  size: json['size'] as String,
  time: json['time'] as String,
  expiration: json['expiration'] as String,
  image: ImageDetail.fromJson(json['image'] as Map<String, dynamic>),
  thumb: ImageDetail.fromJson(json['thumb'] as Map<String, dynamic>),
  medium: ImageDetail.fromJson(json['medium'] as Map<String, dynamic>),
  deleteUrl: json['delete_url'] as String,
);

Map<String, dynamic> _$UploadDataToJson(_UploadData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url_viewer': instance.urlViewer,
      'url': instance.url,
      'display_url': instance.displayUrl,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'time': instance.time,
      'expiration': instance.expiration,
      'image': instance.image,
      'thumb': instance.thumb,
      'medium': instance.medium,
      'delete_url': instance.deleteUrl,
    };
