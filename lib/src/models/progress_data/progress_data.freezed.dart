// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressData {

 int get count; int get total;
/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressDataCopyWith<ProgressData> get copyWith => _$ProgressDataCopyWithImpl<ProgressData>(this as ProgressData, _$identity);

  /// Serializes this ProgressData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressData&&(identical(other.count, count) || other.count == count)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,total);

@override
String toString() {
  return 'ProgressData(count: $count, total: $total)';
}


}

/// @nodoc
abstract mixin class $ProgressDataCopyWith<$Res>  {
  factory $ProgressDataCopyWith(ProgressData value, $Res Function(ProgressData) _then) = _$ProgressDataCopyWithImpl;
@useResult
$Res call({
 int count, int total
});




}
/// @nodoc
class _$ProgressDataCopyWithImpl<$Res>
    implements $ProgressDataCopyWith<$Res> {
  _$ProgressDataCopyWithImpl(this._self, this._then);

  final ProgressData _self;
  final $Res Function(ProgressData) _then;

/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? total = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressData].
extension ProgressDataPatterns on ProgressData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressData value)  $default,){
final _that = this;
switch (_that) {
case _ProgressData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressData value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
return $default(_that.count,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int total)  $default,) {final _that = this;
switch (_that) {
case _ProgressData():
return $default(_that.count,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
return $default(_that.count,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressData extends ProgressData {
  const _ProgressData({required this.count, required this.total}): super._();
  factory _ProgressData.fromJson(Map<String, dynamic> json) => _$ProgressDataFromJson(json);

@override final  int count;
@override final  int total;

/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressDataCopyWith<_ProgressData> get copyWith => __$ProgressDataCopyWithImpl<_ProgressData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressData&&(identical(other.count, count) || other.count == count)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,total);

@override
String toString() {
  return 'ProgressData(count: $count, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ProgressDataCopyWith<$Res> implements $ProgressDataCopyWith<$Res> {
  factory _$ProgressDataCopyWith(_ProgressData value, $Res Function(_ProgressData) _then) = __$ProgressDataCopyWithImpl;
@override @useResult
$Res call({
 int count, int total
});




}
/// @nodoc
class __$ProgressDataCopyWithImpl<$Res>
    implements _$ProgressDataCopyWith<$Res> {
  __$ProgressDataCopyWithImpl(this._self, this._then);

  final _ProgressData _self;
  final $Res Function(_ProgressData) _then;

/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? total = null,}) {
  return _then(_ProgressData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
