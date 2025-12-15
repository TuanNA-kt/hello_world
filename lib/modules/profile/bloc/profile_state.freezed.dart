// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 String get language; String get appVersion; User get user; AvatarPath? get temporaryAvatarUrl; Fullname get fullNameForm; PhoneNumber get phoneNumberForm; Birthday? get birthDayForm; bool get isValid; bool get isLoading; bool get isSaving; bool get isSuccess;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.language, language) || other.language == language)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.user, user) || other.user == user)&&(identical(other.temporaryAvatarUrl, temporaryAvatarUrl) || other.temporaryAvatarUrl == temporaryAvatarUrl)&&(identical(other.fullNameForm, fullNameForm) || other.fullNameForm == fullNameForm)&&(identical(other.phoneNumberForm, phoneNumberForm) || other.phoneNumberForm == phoneNumberForm)&&(identical(other.birthDayForm, birthDayForm) || other.birthDayForm == birthDayForm)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,language,appVersion,user,temporaryAvatarUrl,fullNameForm,phoneNumberForm,birthDayForm,isValid,isLoading,isSaving,isSuccess);

@override
String toString() {
  return 'ProfileState(language: $language, appVersion: $appVersion, user: $user, temporaryAvatarUrl: $temporaryAvatarUrl, fullNameForm: $fullNameForm, phoneNumberForm: $phoneNumberForm, birthDayForm: $birthDayForm, isValid: $isValid, isLoading: $isLoading, isSaving: $isSaving, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 String language, String appVersion, User user, AvatarPath? temporaryAvatarUrl, Fullname fullNameForm, PhoneNumber phoneNumberForm, Birthday? birthDayForm, bool isValid, bool isLoading, bool isSaving, bool isSuccess
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = null,Object? appVersion = null,Object? user = null,Object? temporaryAvatarUrl = freezed,Object? fullNameForm = null,Object? phoneNumberForm = null,Object? birthDayForm = freezed,Object? isValid = null,Object? isLoading = null,Object? isSaving = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,temporaryAvatarUrl: freezed == temporaryAvatarUrl ? _self.temporaryAvatarUrl : temporaryAvatarUrl // ignore: cast_nullable_to_non_nullable
as AvatarPath?,fullNameForm: null == fullNameForm ? _self.fullNameForm : fullNameForm // ignore: cast_nullable_to_non_nullable
as Fullname,phoneNumberForm: null == phoneNumberForm ? _self.phoneNumberForm : phoneNumberForm // ignore: cast_nullable_to_non_nullable
as PhoneNumber,birthDayForm: freezed == birthDayForm ? _self.birthDayForm : birthDayForm // ignore: cast_nullable_to_non_nullable
as Birthday?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String language,  String appVersion,  User user,  AvatarPath? temporaryAvatarUrl,  Fullname fullNameForm,  PhoneNumber phoneNumberForm,  Birthday? birthDayForm,  bool isValid,  bool isLoading,  bool isSaving,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.language,_that.appVersion,_that.user,_that.temporaryAvatarUrl,_that.fullNameForm,_that.phoneNumberForm,_that.birthDayForm,_that.isValid,_that.isLoading,_that.isSaving,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String language,  String appVersion,  User user,  AvatarPath? temporaryAvatarUrl,  Fullname fullNameForm,  PhoneNumber phoneNumberForm,  Birthday? birthDayForm,  bool isValid,  bool isLoading,  bool isSaving,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.language,_that.appVersion,_that.user,_that.temporaryAvatarUrl,_that.fullNameForm,_that.phoneNumberForm,_that.birthDayForm,_that.isValid,_that.isLoading,_that.isSaving,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String language,  String appVersion,  User user,  AvatarPath? temporaryAvatarUrl,  Fullname fullNameForm,  PhoneNumber phoneNumberForm,  Birthday? birthDayForm,  bool isValid,  bool isLoading,  bool isSaving,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.language,_that.appVersion,_that.user,_that.temporaryAvatarUrl,_that.fullNameForm,_that.phoneNumberForm,_that.birthDayForm,_that.isValid,_that.isLoading,_that.isSaving,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.language = '', this.appVersion = '1.0.0', this.user = User.empty, this.temporaryAvatarUrl, this.fullNameForm = const Fullname.pure(), this.phoneNumberForm = const PhoneNumber.pure(), this.birthDayForm, this.isValid = false, this.isLoading = false, this.isSaving = false, this.isSuccess = false});
  

@override@JsonKey() final  String language;
@override@JsonKey() final  String appVersion;
@override@JsonKey() final  User user;
@override final  AvatarPath? temporaryAvatarUrl;
@override@JsonKey() final  Fullname fullNameForm;
@override@JsonKey() final  PhoneNumber phoneNumberForm;
@override final  Birthday? birthDayForm;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.language, language) || other.language == language)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.user, user) || other.user == user)&&(identical(other.temporaryAvatarUrl, temporaryAvatarUrl) || other.temporaryAvatarUrl == temporaryAvatarUrl)&&(identical(other.fullNameForm, fullNameForm) || other.fullNameForm == fullNameForm)&&(identical(other.phoneNumberForm, phoneNumberForm) || other.phoneNumberForm == phoneNumberForm)&&(identical(other.birthDayForm, birthDayForm) || other.birthDayForm == birthDayForm)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,language,appVersion,user,temporaryAvatarUrl,fullNameForm,phoneNumberForm,birthDayForm,isValid,isLoading,isSaving,isSuccess);

@override
String toString() {
  return 'ProfileState(language: $language, appVersion: $appVersion, user: $user, temporaryAvatarUrl: $temporaryAvatarUrl, fullNameForm: $fullNameForm, phoneNumberForm: $phoneNumberForm, birthDayForm: $birthDayForm, isValid: $isValid, isLoading: $isLoading, isSaving: $isSaving, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 String language, String appVersion, User user, AvatarPath? temporaryAvatarUrl, Fullname fullNameForm, PhoneNumber phoneNumberForm, Birthday? birthDayForm, bool isValid, bool isLoading, bool isSaving, bool isSuccess
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,Object? appVersion = null,Object? user = null,Object? temporaryAvatarUrl = freezed,Object? fullNameForm = null,Object? phoneNumberForm = null,Object? birthDayForm = freezed,Object? isValid = null,Object? isLoading = null,Object? isSaving = null,Object? isSuccess = null,}) {
  return _then(_ProfileState(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,temporaryAvatarUrl: freezed == temporaryAvatarUrl ? _self.temporaryAvatarUrl : temporaryAvatarUrl // ignore: cast_nullable_to_non_nullable
as AvatarPath?,fullNameForm: null == fullNameForm ? _self.fullNameForm : fullNameForm // ignore: cast_nullable_to_non_nullable
as Fullname,phoneNumberForm: null == phoneNumberForm ? _self.phoneNumberForm : phoneNumberForm // ignore: cast_nullable_to_non_nullable
as PhoneNumber,birthDayForm: freezed == birthDayForm ? _self.birthDayForm : birthDayForm // ignore: cast_nullable_to_non_nullable
as Birthday?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
