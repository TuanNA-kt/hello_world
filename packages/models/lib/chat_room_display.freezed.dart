// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_display.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoomDisplay {

 String get id; String get name; String get avatarUrl; DateTime get updatedAt; String get lastMessageText; String get senderId; int get unreadCount; bool get isTyping;
/// Create a copy of ChatRoomDisplay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomDisplayCopyWith<ChatRoomDisplay> get copyWith => _$ChatRoomDisplayCopyWithImpl<ChatRoomDisplay>(this as ChatRoomDisplay, _$identity);

  /// Serializes this ChatRoomDisplay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomDisplay&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isTyping, isTyping) || other.isTyping == isTyping));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,updatedAt,lastMessageText,senderId,unreadCount,isTyping);

@override
String toString() {
  return 'ChatRoomDisplay(id: $id, name: $name, avatarUrl: $avatarUrl, updatedAt: $updatedAt, lastMessageText: $lastMessageText, senderId: $senderId, unreadCount: $unreadCount, isTyping: $isTyping)';
}


}

/// @nodoc
abstract mixin class $ChatRoomDisplayCopyWith<$Res>  {
  factory $ChatRoomDisplayCopyWith(ChatRoomDisplay value, $Res Function(ChatRoomDisplay) _then) = _$ChatRoomDisplayCopyWithImpl;
@useResult
$Res call({
 String id, String name, String avatarUrl, DateTime updatedAt, String lastMessageText, String senderId, int unreadCount, bool isTyping
});




}
/// @nodoc
class _$ChatRoomDisplayCopyWithImpl<$Res>
    implements $ChatRoomDisplayCopyWith<$Res> {
  _$ChatRoomDisplayCopyWithImpl(this._self, this._then);

  final ChatRoomDisplay _self;
  final $Res Function(ChatRoomDisplay) _then;

/// Create a copy of ChatRoomDisplay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,Object? updatedAt = null,Object? lastMessageText = null,Object? senderId = null,Object? unreadCount = null,Object? isTyping = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageText: null == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isTyping: null == isTyping ? _self.isTyping : isTyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoomDisplay].
extension ChatRoomDisplayPatterns on ChatRoomDisplay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoomDisplay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoomDisplay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoomDisplay value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoomDisplay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoomDisplay value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoomDisplay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl,  DateTime updatedAt,  String lastMessageText,  String senderId,  int unreadCount,  bool isTyping)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoomDisplay() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.updatedAt,_that.lastMessageText,_that.senderId,_that.unreadCount,_that.isTyping);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl,  DateTime updatedAt,  String lastMessageText,  String senderId,  int unreadCount,  bool isTyping)  $default,) {final _that = this;
switch (_that) {
case _ChatRoomDisplay():
return $default(_that.id,_that.name,_that.avatarUrl,_that.updatedAt,_that.lastMessageText,_that.senderId,_that.unreadCount,_that.isTyping);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String avatarUrl,  DateTime updatedAt,  String lastMessageText,  String senderId,  int unreadCount,  bool isTyping)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoomDisplay() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.updatedAt,_that.lastMessageText,_that.senderId,_that.unreadCount,_that.isTyping);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRoomDisplay implements ChatRoomDisplay {
   _ChatRoomDisplay({required this.id, required this.name, required this.avatarUrl, required this.updatedAt, required this.lastMessageText, required this.senderId, this.unreadCount = 0, this.isTyping = false});
  factory _ChatRoomDisplay.fromJson(Map<String, dynamic> json) => _$ChatRoomDisplayFromJson(json);

@override final  String id;
@override final  String name;
@override final  String avatarUrl;
@override final  DateTime updatedAt;
@override final  String lastMessageText;
@override final  String senderId;
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isTyping;

/// Create a copy of ChatRoomDisplay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomDisplayCopyWith<_ChatRoomDisplay> get copyWith => __$ChatRoomDisplayCopyWithImpl<_ChatRoomDisplay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoomDisplayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoomDisplay&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isTyping, isTyping) || other.isTyping == isTyping));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,updatedAt,lastMessageText,senderId,unreadCount,isTyping);

@override
String toString() {
  return 'ChatRoomDisplay(id: $id, name: $name, avatarUrl: $avatarUrl, updatedAt: $updatedAt, lastMessageText: $lastMessageText, senderId: $senderId, unreadCount: $unreadCount, isTyping: $isTyping)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomDisplayCopyWith<$Res> implements $ChatRoomDisplayCopyWith<$Res> {
  factory _$ChatRoomDisplayCopyWith(_ChatRoomDisplay value, $Res Function(_ChatRoomDisplay) _then) = __$ChatRoomDisplayCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String avatarUrl, DateTime updatedAt, String lastMessageText, String senderId, int unreadCount, bool isTyping
});




}
/// @nodoc
class __$ChatRoomDisplayCopyWithImpl<$Res>
    implements _$ChatRoomDisplayCopyWith<$Res> {
  __$ChatRoomDisplayCopyWithImpl(this._self, this._then);

  final _ChatRoomDisplay _self;
  final $Res Function(_ChatRoomDisplay) _then;

/// Create a copy of ChatRoomDisplay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,Object? updatedAt = null,Object? lastMessageText = null,Object? senderId = null,Object? unreadCount = null,Object? isTyping = null,}) {
  return _then(_ChatRoomDisplay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageText: null == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isTyping: null == isTyping ? _self.isTyping : isTyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
