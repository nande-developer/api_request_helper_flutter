// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceException {

 String? get code; String? get message; StackTrace? get stackTrace;
/// Create a copy of ServiceException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceExceptionCopyWith<ServiceException> get copyWith => _$ServiceExceptionCopyWithImpl<ServiceException>(this as ServiceException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceException&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,stackTrace);

@override
String toString() {
  return 'ServiceException(code: $code, message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ServiceExceptionCopyWith<$Res>  {
  factory $ServiceExceptionCopyWith(ServiceException value, $Res Function(ServiceException) _then) = _$ServiceExceptionCopyWithImpl;
@useResult
$Res call({
 String? code, String? message, StackTrace? stackTrace
});




}
/// @nodoc
class _$ServiceExceptionCopyWithImpl<$Res>
    implements $ServiceExceptionCopyWith<$Res> {
  _$ServiceExceptionCopyWithImpl(this._self, this._then);

  final ServiceException _self;
  final $Res Function(ServiceException) _then;

/// Create a copy of ServiceException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? message = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceException].
extension ServiceExceptionPatterns on ServiceException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceException value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceException() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceException value)  $default,){
final _that = this;
switch (_that) {
case _ServiceException():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceException value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceException() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? code,  String? message,  StackTrace? stackTrace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceException() when $default != null:
return $default(_that.code,_that.message,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? code,  String? message,  StackTrace? stackTrace)  $default,) {final _that = this;
switch (_that) {
case _ServiceException():
return $default(_that.code,_that.message,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? code,  String? message,  StackTrace? stackTrace)?  $default,) {final _that = this;
switch (_that) {
case _ServiceException() when $default != null:
return $default(_that.code,_that.message,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceException extends ServiceException {
  const _ServiceException({this.code, this.message, this.stackTrace}): super._();
  

@override final  String? code;
@override final  String? message;
@override final  StackTrace? stackTrace;

/// Create a copy of ServiceException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceExceptionCopyWith<_ServiceException> get copyWith => __$ServiceExceptionCopyWithImpl<_ServiceException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceException&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,stackTrace);

@override
String toString() {
  return 'ServiceException(code: $code, message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class _$ServiceExceptionCopyWith<$Res> implements $ServiceExceptionCopyWith<$Res> {
  factory _$ServiceExceptionCopyWith(_ServiceException value, $Res Function(_ServiceException) _then) = __$ServiceExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? code, String? message, StackTrace? stackTrace
});




}
/// @nodoc
class __$ServiceExceptionCopyWithImpl<$Res>
    implements _$ServiceExceptionCopyWith<$Res> {
  __$ServiceExceptionCopyWithImpl(this._self, this._then);

  final _ServiceException _self;
  final $Res Function(_ServiceException) _then;

/// Create a copy of ServiceException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = freezed,Object? stackTrace = freezed,}) {
  return _then(_ServiceException(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
