// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadData {

 String get id; String get title;@JsonKey(name: 'url_viewer') String get urlViewer; String get url;@JsonKey(name: 'display_url') String get displayUrl; String get width; String get height; String get size; String get time; String get expiration; ImageDetail get image; ImageDetail get thumb; ImageDetail get medium;@JsonKey(name: 'delete_url') String get deleteUrl;
/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadDataCopyWith<UploadData> get copyWith => _$UploadDataCopyWithImpl<UploadData>(this as UploadData, _$identity);

  /// Serializes this UploadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.urlViewer, urlViewer) || other.urlViewer == urlViewer)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayUrl, displayUrl) || other.displayUrl == displayUrl)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.size, size) || other.size == size)&&(identical(other.time, time) || other.time == time)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.image, image) || other.image == image)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.deleteUrl, deleteUrl) || other.deleteUrl == deleteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,urlViewer,url,displayUrl,width,height,size,time,expiration,image,thumb,medium,deleteUrl);

@override
String toString() {
  return 'UploadData(id: $id, title: $title, urlViewer: $urlViewer, url: $url, displayUrl: $displayUrl, width: $width, height: $height, size: $size, time: $time, expiration: $expiration, image: $image, thumb: $thumb, medium: $medium, deleteUrl: $deleteUrl)';
}


}

/// @nodoc
abstract mixin class $UploadDataCopyWith<$Res>  {
  factory $UploadDataCopyWith(UploadData value, $Res Function(UploadData) _then) = _$UploadDataCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'url_viewer') String urlViewer, String url,@JsonKey(name: 'display_url') String displayUrl, String width, String height, String size, String time, String expiration, ImageDetail image, ImageDetail thumb, ImageDetail medium,@JsonKey(name: 'delete_url') String deleteUrl
});


$ImageDetailCopyWith<$Res> get image;$ImageDetailCopyWith<$Res> get thumb;$ImageDetailCopyWith<$Res> get medium;

}
/// @nodoc
class _$UploadDataCopyWithImpl<$Res>
    implements $UploadDataCopyWith<$Res> {
  _$UploadDataCopyWithImpl(this._self, this._then);

  final UploadData _self;
  final $Res Function(UploadData) _then;

/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? urlViewer = null,Object? url = null,Object? displayUrl = null,Object? width = null,Object? height = null,Object? size = null,Object? time = null,Object? expiration = null,Object? image = null,Object? thumb = null,Object? medium = null,Object? deleteUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,urlViewer: null == urlViewer ? _self.urlViewer : urlViewer // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,displayUrl: null == displayUrl ? _self.displayUrl : displayUrl // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageDetail,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as ImageDetail,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as ImageDetail,deleteUrl: null == deleteUrl ? _self.deleteUrl : deleteUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get image {
  
  return $ImageDetailCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get thumb {
  
  return $ImageDetailCopyWith<$Res>(_self.thumb, (value) {
    return _then(_self.copyWith(thumb: value));
  });
}/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get medium {
  
  return $ImageDetailCopyWith<$Res>(_self.medium, (value) {
    return _then(_self.copyWith(medium: value));
  });
}
}


/// Adds pattern-matching-related methods to [UploadData].
extension UploadDataPatterns on UploadData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadData value)  $default,){
final _that = this;
switch (_that) {
case _UploadData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadData value)?  $default,){
final _that = this;
switch (_that) {
case _UploadData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'url_viewer')  String urlViewer,  String url, @JsonKey(name: 'display_url')  String displayUrl,  String width,  String height,  String size,  String time,  String expiration,  ImageDetail image,  ImageDetail thumb,  ImageDetail medium, @JsonKey(name: 'delete_url')  String deleteUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadData() when $default != null:
return $default(_that.id,_that.title,_that.urlViewer,_that.url,_that.displayUrl,_that.width,_that.height,_that.size,_that.time,_that.expiration,_that.image,_that.thumb,_that.medium,_that.deleteUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'url_viewer')  String urlViewer,  String url, @JsonKey(name: 'display_url')  String displayUrl,  String width,  String height,  String size,  String time,  String expiration,  ImageDetail image,  ImageDetail thumb,  ImageDetail medium, @JsonKey(name: 'delete_url')  String deleteUrl)  $default,) {final _that = this;
switch (_that) {
case _UploadData():
return $default(_that.id,_that.title,_that.urlViewer,_that.url,_that.displayUrl,_that.width,_that.height,_that.size,_that.time,_that.expiration,_that.image,_that.thumb,_that.medium,_that.deleteUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'url_viewer')  String urlViewer,  String url, @JsonKey(name: 'display_url')  String displayUrl,  String width,  String height,  String size,  String time,  String expiration,  ImageDetail image,  ImageDetail thumb,  ImageDetail medium, @JsonKey(name: 'delete_url')  String deleteUrl)?  $default,) {final _that = this;
switch (_that) {
case _UploadData() when $default != null:
return $default(_that.id,_that.title,_that.urlViewer,_that.url,_that.displayUrl,_that.width,_that.height,_that.size,_that.time,_that.expiration,_that.image,_that.thumb,_that.medium,_that.deleteUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadData implements UploadData {
  const _UploadData({required this.id, required this.title, @JsonKey(name: 'url_viewer') required this.urlViewer, required this.url, @JsonKey(name: 'display_url') required this.displayUrl, required this.width, required this.height, required this.size, required this.time, required this.expiration, required this.image, required this.thumb, required this.medium, @JsonKey(name: 'delete_url') required this.deleteUrl});
  factory _UploadData.fromJson(Map<String, dynamic> json) => _$UploadDataFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'url_viewer') final  String urlViewer;
@override final  String url;
@override@JsonKey(name: 'display_url') final  String displayUrl;
@override final  String width;
@override final  String height;
@override final  String size;
@override final  String time;
@override final  String expiration;
@override final  ImageDetail image;
@override final  ImageDetail thumb;
@override final  ImageDetail medium;
@override@JsonKey(name: 'delete_url') final  String deleteUrl;

/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadDataCopyWith<_UploadData> get copyWith => __$UploadDataCopyWithImpl<_UploadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.urlViewer, urlViewer) || other.urlViewer == urlViewer)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayUrl, displayUrl) || other.displayUrl == displayUrl)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.size, size) || other.size == size)&&(identical(other.time, time) || other.time == time)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.image, image) || other.image == image)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.deleteUrl, deleteUrl) || other.deleteUrl == deleteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,urlViewer,url,displayUrl,width,height,size,time,expiration,image,thumb,medium,deleteUrl);

@override
String toString() {
  return 'UploadData(id: $id, title: $title, urlViewer: $urlViewer, url: $url, displayUrl: $displayUrl, width: $width, height: $height, size: $size, time: $time, expiration: $expiration, image: $image, thumb: $thumb, medium: $medium, deleteUrl: $deleteUrl)';
}


}

/// @nodoc
abstract mixin class _$UploadDataCopyWith<$Res> implements $UploadDataCopyWith<$Res> {
  factory _$UploadDataCopyWith(_UploadData value, $Res Function(_UploadData) _then) = __$UploadDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'url_viewer') String urlViewer, String url,@JsonKey(name: 'display_url') String displayUrl, String width, String height, String size, String time, String expiration, ImageDetail image, ImageDetail thumb, ImageDetail medium,@JsonKey(name: 'delete_url') String deleteUrl
});


@override $ImageDetailCopyWith<$Res> get image;@override $ImageDetailCopyWith<$Res> get thumb;@override $ImageDetailCopyWith<$Res> get medium;

}
/// @nodoc
class __$UploadDataCopyWithImpl<$Res>
    implements _$UploadDataCopyWith<$Res> {
  __$UploadDataCopyWithImpl(this._self, this._then);

  final _UploadData _self;
  final $Res Function(_UploadData) _then;

/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? urlViewer = null,Object? url = null,Object? displayUrl = null,Object? width = null,Object? height = null,Object? size = null,Object? time = null,Object? expiration = null,Object? image = null,Object? thumb = null,Object? medium = null,Object? deleteUrl = null,}) {
  return _then(_UploadData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,urlViewer: null == urlViewer ? _self.urlViewer : urlViewer // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,displayUrl: null == displayUrl ? _self.displayUrl : displayUrl // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageDetail,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as ImageDetail,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as ImageDetail,deleteUrl: null == deleteUrl ? _self.deleteUrl : deleteUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get image {
  
  return $ImageDetailCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get thumb {
  
  return $ImageDetailCopyWith<$Res>(_self.thumb, (value) {
    return _then(_self.copyWith(thumb: value));
  });
}/// Create a copy of UploadData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<$Res> get medium {
  
  return $ImageDetailCopyWith<$Res>(_self.medium, (value) {
    return _then(_self.copyWith(medium: value));
  });
}
}

// dart format on
