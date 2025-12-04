// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageDetail {

 String get filename; String get name; String get mime; String get extension; String get url;
/// Create a copy of ImageDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageDetailCopyWith<ImageDetail> get copyWith => _$ImageDetailCopyWithImpl<ImageDetail>(this as ImageDetail, _$identity);

  /// Serializes this ImageDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageDetail&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.name, name) || other.name == name)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,name,mime,extension,url);

@override
String toString() {
  return 'ImageDetail(filename: $filename, name: $name, mime: $mime, extension: $extension, url: $url)';
}


}

/// @nodoc
abstract mixin class $ImageDetailCopyWith<$Res>  {
  factory $ImageDetailCopyWith(ImageDetail value, $Res Function(ImageDetail) _then) = _$ImageDetailCopyWithImpl;
@useResult
$Res call({
 String filename, String name, String mime, String extension, String url
});




}
/// @nodoc
class _$ImageDetailCopyWithImpl<$Res>
    implements $ImageDetailCopyWith<$Res> {
  _$ImageDetailCopyWithImpl(this._self, this._then);

  final ImageDetail _self;
  final $Res Function(ImageDetail) _then;

/// Create a copy of ImageDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = null,Object? name = null,Object? mime = null,Object? extension = null,Object? url = null,}) {
  return _then(_self.copyWith(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageDetail].
extension ImageDetailPatterns on ImageDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageDetail value)  $default,){
final _that = this;
switch (_that) {
case _ImageDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ImageDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filename,  String name,  String mime,  String extension,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageDetail() when $default != null:
return $default(_that.filename,_that.name,_that.mime,_that.extension,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filename,  String name,  String mime,  String extension,  String url)  $default,) {final _that = this;
switch (_that) {
case _ImageDetail():
return $default(_that.filename,_that.name,_that.mime,_that.extension,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filename,  String name,  String mime,  String extension,  String url)?  $default,) {final _that = this;
switch (_that) {
case _ImageDetail() when $default != null:
return $default(_that.filename,_that.name,_that.mime,_that.extension,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageDetail implements ImageDetail {
  const _ImageDetail({required this.filename, required this.name, required this.mime, required this.extension, required this.url});
  factory _ImageDetail.fromJson(Map<String, dynamic> json) => _$ImageDetailFromJson(json);

@override final  String filename;
@override final  String name;
@override final  String mime;
@override final  String extension;
@override final  String url;

/// Create a copy of ImageDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageDetailCopyWith<_ImageDetail> get copyWith => __$ImageDetailCopyWithImpl<_ImageDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageDetail&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.name, name) || other.name == name)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,name,mime,extension,url);

@override
String toString() {
  return 'ImageDetail(filename: $filename, name: $name, mime: $mime, extension: $extension, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ImageDetailCopyWith<$Res> implements $ImageDetailCopyWith<$Res> {
  factory _$ImageDetailCopyWith(_ImageDetail value, $Res Function(_ImageDetail) _then) = __$ImageDetailCopyWithImpl;
@override @useResult
$Res call({
 String filename, String name, String mime, String extension, String url
});




}
/// @nodoc
class __$ImageDetailCopyWithImpl<$Res>
    implements _$ImageDetailCopyWith<$Res> {
  __$ImageDetailCopyWithImpl(this._self, this._then);

  final _ImageDetail _self;
  final $Res Function(_ImageDetail) _then;

/// Create a copy of ImageDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? name = null,Object? mime = null,Object? extension = null,Object? url = null,}) {
  return _then(_ImageDetail(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
