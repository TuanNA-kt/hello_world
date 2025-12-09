// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewChatState {

 NewChatStatus get status; List<User> get friendList; List<User> get filteredFriendList; List<User> get selectedUsers; String get searchQuery; String get errorMessage;
/// Create a copy of NewChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewChatStateCopyWith<NewChatState> get copyWith => _$NewChatStateCopyWithImpl<NewChatState>(this as NewChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.friendList, friendList)&&const DeepCollectionEquality().equals(other.filteredFriendList, filteredFriendList)&&const DeepCollectionEquality().equals(other.selectedUsers, selectedUsers)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(friendList),const DeepCollectionEquality().hash(filteredFriendList),const DeepCollectionEquality().hash(selectedUsers),searchQuery,errorMessage);

@override
String toString() {
  return 'NewChatState(status: $status, friendList: $friendList, filteredFriendList: $filteredFriendList, selectedUsers: $selectedUsers, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NewChatStateCopyWith<$Res>  {
  factory $NewChatStateCopyWith(NewChatState value, $Res Function(NewChatState) _then) = _$NewChatStateCopyWithImpl;
@useResult
$Res call({
 NewChatStatus status, List<User> friendList, List<User> filteredFriendList, List<User> selectedUsers, String searchQuery, String errorMessage
});




}
/// @nodoc
class _$NewChatStateCopyWithImpl<$Res>
    implements $NewChatStateCopyWith<$Res> {
  _$NewChatStateCopyWithImpl(this._self, this._then);

  final NewChatState _self;
  final $Res Function(NewChatState) _then;

/// Create a copy of NewChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? friendList = null,Object? filteredFriendList = null,Object? selectedUsers = null,Object? searchQuery = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewChatStatus,friendList: null == friendList ? _self.friendList : friendList // ignore: cast_nullable_to_non_nullable
as List<User>,filteredFriendList: null == filteredFriendList ? _self.filteredFriendList : filteredFriendList // ignore: cast_nullable_to_non_nullable
as List<User>,selectedUsers: null == selectedUsers ? _self.selectedUsers : selectedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewChatState].
extension NewChatStatePatterns on NewChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewChatState value)  $default,){
final _that = this;
switch (_that) {
case _NewChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewChatState value)?  $default,){
final _that = this;
switch (_that) {
case _NewChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NewChatStatus status,  List<User> friendList,  List<User> filteredFriendList,  List<User> selectedUsers,  String searchQuery,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewChatState() when $default != null:
return $default(_that.status,_that.friendList,_that.filteredFriendList,_that.selectedUsers,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NewChatStatus status,  List<User> friendList,  List<User> filteredFriendList,  List<User> selectedUsers,  String searchQuery,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NewChatState():
return $default(_that.status,_that.friendList,_that.filteredFriendList,_that.selectedUsers,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NewChatStatus status,  List<User> friendList,  List<User> filteredFriendList,  List<User> selectedUsers,  String searchQuery,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewChatState() when $default != null:
return $default(_that.status,_that.friendList,_that.filteredFriendList,_that.selectedUsers,_that.searchQuery,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewChatState implements NewChatState {
  const _NewChatState({this.status = NewChatStatus.initial, final  List<User> friendList = const [], final  List<User> filteredFriendList = const [], final  List<User> selectedUsers = const [], this.searchQuery = '', this.errorMessage = ''}): _friendList = friendList,_filteredFriendList = filteredFriendList,_selectedUsers = selectedUsers;
  

@override@JsonKey() final  NewChatStatus status;
 final  List<User> _friendList;
@override@JsonKey() List<User> get friendList {
  if (_friendList is EqualUnmodifiableListView) return _friendList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friendList);
}

 final  List<User> _filteredFriendList;
@override@JsonKey() List<User> get filteredFriendList {
  if (_filteredFriendList is EqualUnmodifiableListView) return _filteredFriendList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredFriendList);
}

 final  List<User> _selectedUsers;
@override@JsonKey() List<User> get selectedUsers {
  if (_selectedUsers is EqualUnmodifiableListView) return _selectedUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedUsers);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  String errorMessage;

/// Create a copy of NewChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewChatStateCopyWith<_NewChatState> get copyWith => __$NewChatStateCopyWithImpl<_NewChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._friendList, _friendList)&&const DeepCollectionEquality().equals(other._filteredFriendList, _filteredFriendList)&&const DeepCollectionEquality().equals(other._selectedUsers, _selectedUsers)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_friendList),const DeepCollectionEquality().hash(_filteredFriendList),const DeepCollectionEquality().hash(_selectedUsers),searchQuery,errorMessage);

@override
String toString() {
  return 'NewChatState(status: $status, friendList: $friendList, filteredFriendList: $filteredFriendList, selectedUsers: $selectedUsers, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NewChatStateCopyWith<$Res> implements $NewChatStateCopyWith<$Res> {
  factory _$NewChatStateCopyWith(_NewChatState value, $Res Function(_NewChatState) _then) = __$NewChatStateCopyWithImpl;
@override @useResult
$Res call({
 NewChatStatus status, List<User> friendList, List<User> filteredFriendList, List<User> selectedUsers, String searchQuery, String errorMessage
});




}
/// @nodoc
class __$NewChatStateCopyWithImpl<$Res>
    implements _$NewChatStateCopyWith<$Res> {
  __$NewChatStateCopyWithImpl(this._self, this._then);

  final _NewChatState _self;
  final $Res Function(_NewChatState) _then;

/// Create a copy of NewChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? friendList = null,Object? filteredFriendList = null,Object? selectedUsers = null,Object? searchQuery = null,Object? errorMessage = null,}) {
  return _then(_NewChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewChatStatus,friendList: null == friendList ? _self._friendList : friendList // ignore: cast_nullable_to_non_nullable
as List<User>,filteredFriendList: null == filteredFriendList ? _self._filteredFriendList : filteredFriendList // ignore: cast_nullable_to_non_nullable
as List<User>,selectedUsers: null == selectedUsers ? _self._selectedUsers : selectedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
