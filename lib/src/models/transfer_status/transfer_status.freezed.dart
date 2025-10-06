// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TransferStatus _$TransferStatusFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'idle':
          return _Idle.fromJson(
            json
          );
                case 'inProgress':
          return _InProgress.fromJson(
            json
          );
                case 'completed':
          return _Completed.fromJson(
            json
          );
                case 'failed':
          return _Failed.fromJson(
            json
          );
                case 'cancelled':
          return _Cancelled.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'TransferStatus',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$TransferStatus {



  /// Serializes this TransferStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferStatus);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferStatus()';
}


}

/// @nodoc
class $TransferStatusCopyWith<$Res>  {
$TransferStatusCopyWith(TransferStatus _, $Res Function(TransferStatus) __);
}


/// Adds pattern-matching-related methods to [TransferStatus].
extension TransferStatusPatterns on TransferStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _InProgress value)?  inProgress,TResult Function( _Completed value)?  completed,TResult Function( _Failed value)?  failed,TResult Function( _Cancelled value)?  cancelled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Completed() when completed != null:
return completed(_that);case _Failed() when failed != null:
return failed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Completed value)  completed,required TResult Function( _Failed value)  failed,required TResult Function( _Cancelled value)  cancelled,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _InProgress():
return inProgress(_that);case _Completed():
return completed(_that);case _Failed():
return failed(_that);case _Cancelled():
return cancelled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Completed value)?  completed,TResult? Function( _Failed value)?  failed,TResult? Function( _Cancelled value)?  cancelled,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Completed() when completed != null:
return completed(_that);case _Failed() when failed != null:
return failed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( ProgressData progress)?  inProgress,TResult Function()?  completed,TResult Function( String error)?  failed,TResult Function()?  cancelled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _InProgress() when inProgress != null:
return inProgress(_that.progress);case _Completed() when completed != null:
return completed();case _Failed() when failed != null:
return failed(_that.error);case _Cancelled() when cancelled != null:
return cancelled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( ProgressData progress)  inProgress,required TResult Function()  completed,required TResult Function( String error)  failed,required TResult Function()  cancelled,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _InProgress():
return inProgress(_that.progress);case _Completed():
return completed();case _Failed():
return failed(_that.error);case _Cancelled():
return cancelled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( ProgressData progress)?  inProgress,TResult? Function()?  completed,TResult? Function( String error)?  failed,TResult? Function()?  cancelled,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _InProgress() when inProgress != null:
return inProgress(_that.progress);case _Completed() when completed != null:
return completed();case _Failed() when failed != null:
return failed(_that.error);case _Cancelled() when cancelled != null:
return cancelled();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Idle implements TransferStatus {
  const _Idle({final  String? $type}): $type = $type ?? 'idle';
  factory _Idle.fromJson(Map<String, dynamic> json) => _$IdleFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$IdleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferStatus.idle()';
}


}




/// @nodoc
@JsonSerializable()

class _InProgress implements TransferStatus {
  const _InProgress(this.progress, {final  String? $type}): $type = $type ?? 'inProgress';
  factory _InProgress.fromJson(Map<String, dynamic> json) => _$InProgressFromJson(json);

 final  ProgressData progress;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TransferStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InProgressCopyWith<_InProgress> get copyWith => __$InProgressCopyWithImpl<_InProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'TransferStatus.inProgress(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$InProgressCopyWith<$Res> implements $TransferStatusCopyWith<$Res> {
  factory _$InProgressCopyWith(_InProgress value, $Res Function(_InProgress) _then) = __$InProgressCopyWithImpl;
@useResult
$Res call({
 ProgressData progress
});


$ProgressDataCopyWith<$Res> get progress;

}
/// @nodoc
class __$InProgressCopyWithImpl<$Res>
    implements _$InProgressCopyWith<$Res> {
  __$InProgressCopyWithImpl(this._self, this._then);

  final _InProgress _self;
  final $Res Function(_InProgress) _then;

/// Create a copy of TransferStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_InProgress(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressData,
  ));
}

/// Create a copy of TransferStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressDataCopyWith<$Res> get progress {
  
  return $ProgressDataCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _Completed implements TransferStatus {
  const _Completed({final  String? $type}): $type = $type ?? 'completed';
  factory _Completed.fromJson(Map<String, dynamic> json) => _$CompletedFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CompletedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferStatus.completed()';
}


}




/// @nodoc
@JsonSerializable()

class _Failed implements TransferStatus {
  const _Failed(this.error, {final  String? $type}): $type = $type ?? 'failed';
  factory _Failed.fromJson(Map<String, dynamic> json) => _$FailedFromJson(json);

 final  String error;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TransferStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TransferStatus.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $TransferStatusCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of TransferStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Cancelled implements TransferStatus {
  const _Cancelled({final  String? $type}): $type = $type ?? 'cancelled';
  factory _Cancelled.fromJson(Map<String, dynamic> json) => _$CancelledFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CancelledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancelled);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferStatus.cancelled()';
}


}




// dart format on
