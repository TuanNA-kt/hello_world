// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsState {

 ChatsStatus get status; List<ChatRoomDisplay> get chatRooms; List<ChatRoomDisplay> get filteredChatRooms; String get searchQuery; bool get isSearching; int get totalUnreadCount; String get errorMessage;
/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsStateCopyWith<ChatsState> get copyWith => _$ChatsStateCopyWithImpl<ChatsState>(this as ChatsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.chatRooms, chatRooms)&&const DeepCollectionEquality().equals(other.filteredChatRooms, filteredChatRooms)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.totalUnreadCount, totalUnreadCount) || other.totalUnreadCount == totalUnreadCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(chatRooms),const DeepCollectionEquality().hash(filteredChatRooms),searchQuery,isSearching,totalUnreadCount,errorMessage);

@override
String toString() {
  return 'ChatsState(status: $status, chatRooms: $chatRooms, filteredChatRooms: $filteredChatRooms, searchQuery: $searchQuery, isSearching: $isSearching, totalUnreadCount: $totalUnreadCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatsStateCopyWith<$Res>  {
  factory $ChatsStateCopyWith(ChatsState value, $Res Function(ChatsState) _then) = _$ChatsStateCopyWithImpl;
@useResult
$Res call({
 ChatsStatus status, List<ChatRoomDisplay> chatRooms, List<ChatRoomDisplay> filteredChatRooms, String searchQuery, bool isSearching, int totalUnreadCount, String errorMessage
});




}
/// @nodoc
class _$ChatsStateCopyWithImpl<$Res>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._self, this._then);

  final ChatsState _self;
  final $Res Function(ChatsState) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? chatRooms = null,Object? filteredChatRooms = null,Object? searchQuery = null,Object? isSearching = null,Object? totalUnreadCount = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsStatus,chatRooms: null == chatRooms ? _self.chatRooms : chatRooms // ignore: cast_nullable_to_non_nullable
as List<ChatRoomDisplay>,filteredChatRooms: null == filteredChatRooms ? _self.filteredChatRooms : filteredChatRooms // ignore: cast_nullable_to_non_nullable
as List<ChatRoomDisplay>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,totalUnreadCount: null == totalUnreadCount ? _self.totalUnreadCount : totalUnreadCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatsState].
extension ChatsStatePatterns on ChatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatsState value)  $default,){
final _that = this;
switch (_that) {
case _ChatsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatsStatus status,  List<ChatRoomDisplay> chatRooms,  List<ChatRoomDisplay> filteredChatRooms,  String searchQuery,  bool isSearching,  int totalUnreadCount,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
return $default(_that.status,_that.chatRooms,_that.filteredChatRooms,_that.searchQuery,_that.isSearching,_that.totalUnreadCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatsStatus status,  List<ChatRoomDisplay> chatRooms,  List<ChatRoomDisplay> filteredChatRooms,  String searchQuery,  bool isSearching,  int totalUnreadCount,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatsState():
return $default(_that.status,_that.chatRooms,_that.filteredChatRooms,_that.searchQuery,_that.isSearching,_that.totalUnreadCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatsStatus status,  List<ChatRoomDisplay> chatRooms,  List<ChatRoomDisplay> filteredChatRooms,  String searchQuery,  bool isSearching,  int totalUnreadCount,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
return $default(_that.status,_that.chatRooms,_that.filteredChatRooms,_that.searchQuery,_that.isSearching,_that.totalUnreadCount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatsState implements ChatsState {
  const _ChatsState({this.status = ChatsStatus.initial, final  List<ChatRoomDisplay> chatRooms = const [], final  List<ChatRoomDisplay> filteredChatRooms = const [], this.searchQuery = '', this.isSearching = false, this.totalUnreadCount = 0, this.errorMessage = ''}): _chatRooms = chatRooms,_filteredChatRooms = filteredChatRooms;
  

@override@JsonKey() final  ChatsStatus status;
 final  List<ChatRoomDisplay> _chatRooms;
@override@JsonKey() List<ChatRoomDisplay> get chatRooms {
  if (_chatRooms is EqualUnmodifiableListView) return _chatRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatRooms);
}

 final  List<ChatRoomDisplay> _filteredChatRooms;
@override@JsonKey() List<ChatRoomDisplay> get filteredChatRooms {
  if (_filteredChatRooms is EqualUnmodifiableListView) return _filteredChatRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredChatRooms);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  int totalUnreadCount;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatsStateCopyWith<_ChatsState> get copyWith => __$ChatsStateCopyWithImpl<_ChatsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._chatRooms, _chatRooms)&&const DeepCollectionEquality().equals(other._filteredChatRooms, _filteredChatRooms)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.totalUnreadCount, totalUnreadCount) || other.totalUnreadCount == totalUnreadCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_chatRooms),const DeepCollectionEquality().hash(_filteredChatRooms),searchQuery,isSearching,totalUnreadCount,errorMessage);

@override
String toString() {
  return 'ChatsState(status: $status, chatRooms: $chatRooms, filteredChatRooms: $filteredChatRooms, searchQuery: $searchQuery, isSearching: $isSearching, totalUnreadCount: $totalUnreadCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatsStateCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory _$ChatsStateCopyWith(_ChatsState value, $Res Function(_ChatsState) _then) = __$ChatsStateCopyWithImpl;
@override @useResult
$Res call({
 ChatsStatus status, List<ChatRoomDisplay> chatRooms, List<ChatRoomDisplay> filteredChatRooms, String searchQuery, bool isSearching, int totalUnreadCount, String errorMessage
});




}
/// @nodoc
class __$ChatsStateCopyWithImpl<$Res>
    implements _$ChatsStateCopyWith<$Res> {
  __$ChatsStateCopyWithImpl(this._self, this._then);

  final _ChatsState _self;
  final $Res Function(_ChatsState) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? chatRooms = null,Object? filteredChatRooms = null,Object? searchQuery = null,Object? isSearching = null,Object? totalUnreadCount = null,Object? errorMessage = null,}) {
  return _then(_ChatsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsStatus,chatRooms: null == chatRooms ? _self._chatRooms : chatRooms // ignore: cast_nullable_to_non_nullable
as List<ChatRoomDisplay>,filteredChatRooms: null == filteredChatRooms ? _self._filteredChatRooms : filteredChatRooms // ignore: cast_nullable_to_non_nullable
as List<ChatRoomDisplay>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,totalUnreadCount: null == totalUnreadCount ? _self.totalUnreadCount : totalUnreadCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
