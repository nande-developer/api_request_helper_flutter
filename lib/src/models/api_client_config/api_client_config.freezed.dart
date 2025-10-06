// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_client_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiClientConfig implements DiagnosticableTreeMixin {

/// Base URL for all API requests
 String get baseUrl;/// Connect timeout duration (default: 30 seconds)
 Duration get connectTimeout;/// Receive timeout duration (default: 60 seconds)
 Duration get receiveTimeout;/// Send timeout duration (default: 60 seconds)
 Duration get sendTimeout;/// Default headers to be included in all requests
 Map<String, String> get defaultHeaders;/// Additional Dio interceptors
 List<Interceptor> get interceptors;/// Enable logging (default: enabled in debug mode)
 bool? get enableLogging;/// Cache configuration
 CacheOptions? get cacheOptions;/// Certificate pinning configuration
 CertificatePinningConfig? get certificatePinning;/// Maximum number of retry attempts (default: 3)
 int get maxRetries;/// Initial delay for retry with exponential backoff (default: 1 second)
 Duration get retryDelay;/// HTTP methods to retry (default: GET, HEAD, OPTIONS, PUT, DELETE)
 Set<String> get retryableHttpMethods;/// Status codes that should trigger a retry
 Set<int> get retryableStatusCodes;/// Whether to follow redirects (default: true)
 bool get followRedirects;/// Maximum number of redirects to follow (default: 5)
 int get maxRedirects;/// Validate SSL certificates (default: true, false only for dev)
 bool get validateCertificates;
/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiClientConfigCopyWith<ApiClientConfig> get copyWith => _$ApiClientConfigCopyWithImpl<ApiClientConfig>(this as ApiClientConfig, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApiClientConfig'))
    ..add(DiagnosticsProperty('baseUrl', baseUrl))..add(DiagnosticsProperty('connectTimeout', connectTimeout))..add(DiagnosticsProperty('receiveTimeout', receiveTimeout))..add(DiagnosticsProperty('sendTimeout', sendTimeout))..add(DiagnosticsProperty('defaultHeaders', defaultHeaders))..add(DiagnosticsProperty('interceptors', interceptors))..add(DiagnosticsProperty('enableLogging', enableLogging))..add(DiagnosticsProperty('cacheOptions', cacheOptions))..add(DiagnosticsProperty('certificatePinning', certificatePinning))..add(DiagnosticsProperty('maxRetries', maxRetries))..add(DiagnosticsProperty('retryDelay', retryDelay))..add(DiagnosticsProperty('retryableHttpMethods', retryableHttpMethods))..add(DiagnosticsProperty('retryableStatusCodes', retryableStatusCodes))..add(DiagnosticsProperty('followRedirects', followRedirects))..add(DiagnosticsProperty('maxRedirects', maxRedirects))..add(DiagnosticsProperty('validateCertificates', validateCertificates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiClientConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.connectTimeout, connectTimeout) || other.connectTimeout == connectTimeout)&&(identical(other.receiveTimeout, receiveTimeout) || other.receiveTimeout == receiveTimeout)&&(identical(other.sendTimeout, sendTimeout) || other.sendTimeout == sendTimeout)&&const DeepCollectionEquality().equals(other.defaultHeaders, defaultHeaders)&&const DeepCollectionEquality().equals(other.interceptors, interceptors)&&(identical(other.enableLogging, enableLogging) || other.enableLogging == enableLogging)&&(identical(other.cacheOptions, cacheOptions) || other.cacheOptions == cacheOptions)&&(identical(other.certificatePinning, certificatePinning) || other.certificatePinning == certificatePinning)&&(identical(other.maxRetries, maxRetries) || other.maxRetries == maxRetries)&&(identical(other.retryDelay, retryDelay) || other.retryDelay == retryDelay)&&const DeepCollectionEquality().equals(other.retryableHttpMethods, retryableHttpMethods)&&const DeepCollectionEquality().equals(other.retryableStatusCodes, retryableStatusCodes)&&(identical(other.followRedirects, followRedirects) || other.followRedirects == followRedirects)&&(identical(other.maxRedirects, maxRedirects) || other.maxRedirects == maxRedirects)&&(identical(other.validateCertificates, validateCertificates) || other.validateCertificates == validateCertificates));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,connectTimeout,receiveTimeout,sendTimeout,const DeepCollectionEquality().hash(defaultHeaders),const DeepCollectionEquality().hash(interceptors),enableLogging,cacheOptions,certificatePinning,maxRetries,retryDelay,const DeepCollectionEquality().hash(retryableHttpMethods),const DeepCollectionEquality().hash(retryableStatusCodes),followRedirects,maxRedirects,validateCertificates);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApiClientConfig(baseUrl: $baseUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout, sendTimeout: $sendTimeout, defaultHeaders: $defaultHeaders, interceptors: $interceptors, enableLogging: $enableLogging, cacheOptions: $cacheOptions, certificatePinning: $certificatePinning, maxRetries: $maxRetries, retryDelay: $retryDelay, retryableHttpMethods: $retryableHttpMethods, retryableStatusCodes: $retryableStatusCodes, followRedirects: $followRedirects, maxRedirects: $maxRedirects, validateCertificates: $validateCertificates)';
}


}

/// @nodoc
abstract mixin class $ApiClientConfigCopyWith<$Res>  {
  factory $ApiClientConfigCopyWith(ApiClientConfig value, $Res Function(ApiClientConfig) _then) = _$ApiClientConfigCopyWithImpl;
@useResult
$Res call({
 String baseUrl, Duration connectTimeout, Duration receiveTimeout, Duration sendTimeout, Map<String, String> defaultHeaders, List<Interceptor> interceptors, bool? enableLogging, CacheOptions? cacheOptions, CertificatePinningConfig? certificatePinning, int maxRetries, Duration retryDelay, Set<String> retryableHttpMethods, Set<int> retryableStatusCodes, bool followRedirects, int maxRedirects, bool validateCertificates
});


$CertificatePinningConfigCopyWith<$Res>? get certificatePinning;

}
/// @nodoc
class _$ApiClientConfigCopyWithImpl<$Res>
    implements $ApiClientConfigCopyWith<$Res> {
  _$ApiClientConfigCopyWithImpl(this._self, this._then);

  final ApiClientConfig _self;
  final $Res Function(ApiClientConfig) _then;

/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? connectTimeout = null,Object? receiveTimeout = null,Object? sendTimeout = null,Object? defaultHeaders = null,Object? interceptors = null,Object? enableLogging = freezed,Object? cacheOptions = freezed,Object? certificatePinning = freezed,Object? maxRetries = null,Object? retryDelay = null,Object? retryableHttpMethods = null,Object? retryableStatusCodes = null,Object? followRedirects = null,Object? maxRedirects = null,Object? validateCertificates = null,}) {
  return _then(_self.copyWith(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,connectTimeout: null == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration,receiveTimeout: null == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration,sendTimeout: null == sendTimeout ? _self.sendTimeout : sendTimeout // ignore: cast_nullable_to_non_nullable
as Duration,defaultHeaders: null == defaultHeaders ? _self.defaultHeaders : defaultHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>,interceptors: null == interceptors ? _self.interceptors : interceptors // ignore: cast_nullable_to_non_nullable
as List<Interceptor>,enableLogging: freezed == enableLogging ? _self.enableLogging : enableLogging // ignore: cast_nullable_to_non_nullable
as bool?,cacheOptions: freezed == cacheOptions ? _self.cacheOptions : cacheOptions // ignore: cast_nullable_to_non_nullable
as CacheOptions?,certificatePinning: freezed == certificatePinning ? _self.certificatePinning : certificatePinning // ignore: cast_nullable_to_non_nullable
as CertificatePinningConfig?,maxRetries: null == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int,retryDelay: null == retryDelay ? _self.retryDelay : retryDelay // ignore: cast_nullable_to_non_nullable
as Duration,retryableHttpMethods: null == retryableHttpMethods ? _self.retryableHttpMethods : retryableHttpMethods // ignore: cast_nullable_to_non_nullable
as Set<String>,retryableStatusCodes: null == retryableStatusCodes ? _self.retryableStatusCodes : retryableStatusCodes // ignore: cast_nullable_to_non_nullable
as Set<int>,followRedirects: null == followRedirects ? _self.followRedirects : followRedirects // ignore: cast_nullable_to_non_nullable
as bool,maxRedirects: null == maxRedirects ? _self.maxRedirects : maxRedirects // ignore: cast_nullable_to_non_nullable
as int,validateCertificates: null == validateCertificates ? _self.validateCertificates : validateCertificates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CertificatePinningConfigCopyWith<$Res>? get certificatePinning {
    if (_self.certificatePinning == null) {
    return null;
  }

  return $CertificatePinningConfigCopyWith<$Res>(_self.certificatePinning!, (value) {
    return _then(_self.copyWith(certificatePinning: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiClientConfig].
extension ApiClientConfigPatterns on ApiClientConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiClientConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiClientConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiClientConfig value)  $default,){
final _that = this;
switch (_that) {
case _ApiClientConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiClientConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ApiClientConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout,  Duration sendTimeout,  Map<String, String> defaultHeaders,  List<Interceptor> interceptors,  bool? enableLogging,  CacheOptions? cacheOptions,  CertificatePinningConfig? certificatePinning,  int maxRetries,  Duration retryDelay,  Set<String> retryableHttpMethods,  Set<int> retryableStatusCodes,  bool followRedirects,  int maxRedirects,  bool validateCertificates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiClientConfig() when $default != null:
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout,_that.sendTimeout,_that.defaultHeaders,_that.interceptors,_that.enableLogging,_that.cacheOptions,_that.certificatePinning,_that.maxRetries,_that.retryDelay,_that.retryableHttpMethods,_that.retryableStatusCodes,_that.followRedirects,_that.maxRedirects,_that.validateCertificates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout,  Duration sendTimeout,  Map<String, String> defaultHeaders,  List<Interceptor> interceptors,  bool? enableLogging,  CacheOptions? cacheOptions,  CertificatePinningConfig? certificatePinning,  int maxRetries,  Duration retryDelay,  Set<String> retryableHttpMethods,  Set<int> retryableStatusCodes,  bool followRedirects,  int maxRedirects,  bool validateCertificates)  $default,) {final _that = this;
switch (_that) {
case _ApiClientConfig():
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout,_that.sendTimeout,_that.defaultHeaders,_that.interceptors,_that.enableLogging,_that.cacheOptions,_that.certificatePinning,_that.maxRetries,_that.retryDelay,_that.retryableHttpMethods,_that.retryableStatusCodes,_that.followRedirects,_that.maxRedirects,_that.validateCertificates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout,  Duration sendTimeout,  Map<String, String> defaultHeaders,  List<Interceptor> interceptors,  bool? enableLogging,  CacheOptions? cacheOptions,  CertificatePinningConfig? certificatePinning,  int maxRetries,  Duration retryDelay,  Set<String> retryableHttpMethods,  Set<int> retryableStatusCodes,  bool followRedirects,  int maxRedirects,  bool validateCertificates)?  $default,) {final _that = this;
switch (_that) {
case _ApiClientConfig() when $default != null:
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout,_that.sendTimeout,_that.defaultHeaders,_that.interceptors,_that.enableLogging,_that.cacheOptions,_that.certificatePinning,_that.maxRetries,_that.retryDelay,_that.retryableHttpMethods,_that.retryableStatusCodes,_that.followRedirects,_that.maxRedirects,_that.validateCertificates);case _:
  return null;

}
}

}

/// @nodoc


class _ApiClientConfig extends ApiClientConfig with DiagnosticableTreeMixin {
  const _ApiClientConfig({required this.baseUrl, this.connectTimeout = const Duration(seconds: 30), this.receiveTimeout = const Duration(seconds: 60), this.sendTimeout = const Duration(seconds: 60), final  Map<String, String> defaultHeaders = const {}, final  List<Interceptor> interceptors = const [], this.enableLogging, this.cacheOptions, this.certificatePinning, this.maxRetries = 3, this.retryDelay = const Duration(seconds: 1), final  Set<String> retryableHttpMethods = const {'GET', 'HEAD', 'OPTIONS', 'PUT', 'DELETE'}, final  Set<int> retryableStatusCodes = const {408, 429, 500, 502, 503, 504}, this.followRedirects = true, this.maxRedirects = 5, this.validateCertificates = true}): _defaultHeaders = defaultHeaders,_interceptors = interceptors,_retryableHttpMethods = retryableHttpMethods,_retryableStatusCodes = retryableStatusCodes,super._();
  

/// Base URL for all API requests
@override final  String baseUrl;
/// Connect timeout duration (default: 30 seconds)
@override@JsonKey() final  Duration connectTimeout;
/// Receive timeout duration (default: 60 seconds)
@override@JsonKey() final  Duration receiveTimeout;
/// Send timeout duration (default: 60 seconds)
@override@JsonKey() final  Duration sendTimeout;
/// Default headers to be included in all requests
 final  Map<String, String> _defaultHeaders;
/// Default headers to be included in all requests
@override@JsonKey() Map<String, String> get defaultHeaders {
  if (_defaultHeaders is EqualUnmodifiableMapView) return _defaultHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_defaultHeaders);
}

/// Additional Dio interceptors
 final  List<Interceptor> _interceptors;
/// Additional Dio interceptors
@override@JsonKey() List<Interceptor> get interceptors {
  if (_interceptors is EqualUnmodifiableListView) return _interceptors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interceptors);
}

/// Enable logging (default: enabled in debug mode)
@override final  bool? enableLogging;
/// Cache configuration
@override final  CacheOptions? cacheOptions;
/// Certificate pinning configuration
@override final  CertificatePinningConfig? certificatePinning;
/// Maximum number of retry attempts (default: 3)
@override@JsonKey() final  int maxRetries;
/// Initial delay for retry with exponential backoff (default: 1 second)
@override@JsonKey() final  Duration retryDelay;
/// HTTP methods to retry (default: GET, HEAD, OPTIONS, PUT, DELETE)
 final  Set<String> _retryableHttpMethods;
/// HTTP methods to retry (default: GET, HEAD, OPTIONS, PUT, DELETE)
@override@JsonKey() Set<String> get retryableHttpMethods {
  if (_retryableHttpMethods is EqualUnmodifiableSetView) return _retryableHttpMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_retryableHttpMethods);
}

/// Status codes that should trigger a retry
 final  Set<int> _retryableStatusCodes;
/// Status codes that should trigger a retry
@override@JsonKey() Set<int> get retryableStatusCodes {
  if (_retryableStatusCodes is EqualUnmodifiableSetView) return _retryableStatusCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_retryableStatusCodes);
}

/// Whether to follow redirects (default: true)
@override@JsonKey() final  bool followRedirects;
/// Maximum number of redirects to follow (default: 5)
@override@JsonKey() final  int maxRedirects;
/// Validate SSL certificates (default: true, false only for dev)
@override@JsonKey() final  bool validateCertificates;

/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiClientConfigCopyWith<_ApiClientConfig> get copyWith => __$ApiClientConfigCopyWithImpl<_ApiClientConfig>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApiClientConfig'))
    ..add(DiagnosticsProperty('baseUrl', baseUrl))..add(DiagnosticsProperty('connectTimeout', connectTimeout))..add(DiagnosticsProperty('receiveTimeout', receiveTimeout))..add(DiagnosticsProperty('sendTimeout', sendTimeout))..add(DiagnosticsProperty('defaultHeaders', defaultHeaders))..add(DiagnosticsProperty('interceptors', interceptors))..add(DiagnosticsProperty('enableLogging', enableLogging))..add(DiagnosticsProperty('cacheOptions', cacheOptions))..add(DiagnosticsProperty('certificatePinning', certificatePinning))..add(DiagnosticsProperty('maxRetries', maxRetries))..add(DiagnosticsProperty('retryDelay', retryDelay))..add(DiagnosticsProperty('retryableHttpMethods', retryableHttpMethods))..add(DiagnosticsProperty('retryableStatusCodes', retryableStatusCodes))..add(DiagnosticsProperty('followRedirects', followRedirects))..add(DiagnosticsProperty('maxRedirects', maxRedirects))..add(DiagnosticsProperty('validateCertificates', validateCertificates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiClientConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.connectTimeout, connectTimeout) || other.connectTimeout == connectTimeout)&&(identical(other.receiveTimeout, receiveTimeout) || other.receiveTimeout == receiveTimeout)&&(identical(other.sendTimeout, sendTimeout) || other.sendTimeout == sendTimeout)&&const DeepCollectionEquality().equals(other._defaultHeaders, _defaultHeaders)&&const DeepCollectionEquality().equals(other._interceptors, _interceptors)&&(identical(other.enableLogging, enableLogging) || other.enableLogging == enableLogging)&&(identical(other.cacheOptions, cacheOptions) || other.cacheOptions == cacheOptions)&&(identical(other.certificatePinning, certificatePinning) || other.certificatePinning == certificatePinning)&&(identical(other.maxRetries, maxRetries) || other.maxRetries == maxRetries)&&(identical(other.retryDelay, retryDelay) || other.retryDelay == retryDelay)&&const DeepCollectionEquality().equals(other._retryableHttpMethods, _retryableHttpMethods)&&const DeepCollectionEquality().equals(other._retryableStatusCodes, _retryableStatusCodes)&&(identical(other.followRedirects, followRedirects) || other.followRedirects == followRedirects)&&(identical(other.maxRedirects, maxRedirects) || other.maxRedirects == maxRedirects)&&(identical(other.validateCertificates, validateCertificates) || other.validateCertificates == validateCertificates));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,connectTimeout,receiveTimeout,sendTimeout,const DeepCollectionEquality().hash(_defaultHeaders),const DeepCollectionEquality().hash(_interceptors),enableLogging,cacheOptions,certificatePinning,maxRetries,retryDelay,const DeepCollectionEquality().hash(_retryableHttpMethods),const DeepCollectionEquality().hash(_retryableStatusCodes),followRedirects,maxRedirects,validateCertificates);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApiClientConfig(baseUrl: $baseUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout, sendTimeout: $sendTimeout, defaultHeaders: $defaultHeaders, interceptors: $interceptors, enableLogging: $enableLogging, cacheOptions: $cacheOptions, certificatePinning: $certificatePinning, maxRetries: $maxRetries, retryDelay: $retryDelay, retryableHttpMethods: $retryableHttpMethods, retryableStatusCodes: $retryableStatusCodes, followRedirects: $followRedirects, maxRedirects: $maxRedirects, validateCertificates: $validateCertificates)';
}


}

/// @nodoc
abstract mixin class _$ApiClientConfigCopyWith<$Res> implements $ApiClientConfigCopyWith<$Res> {
  factory _$ApiClientConfigCopyWith(_ApiClientConfig value, $Res Function(_ApiClientConfig) _then) = __$ApiClientConfigCopyWithImpl;
@override @useResult
$Res call({
 String baseUrl, Duration connectTimeout, Duration receiveTimeout, Duration sendTimeout, Map<String, String> defaultHeaders, List<Interceptor> interceptors, bool? enableLogging, CacheOptions? cacheOptions, CertificatePinningConfig? certificatePinning, int maxRetries, Duration retryDelay, Set<String> retryableHttpMethods, Set<int> retryableStatusCodes, bool followRedirects, int maxRedirects, bool validateCertificates
});


@override $CertificatePinningConfigCopyWith<$Res>? get certificatePinning;

}
/// @nodoc
class __$ApiClientConfigCopyWithImpl<$Res>
    implements _$ApiClientConfigCopyWith<$Res> {
  __$ApiClientConfigCopyWithImpl(this._self, this._then);

  final _ApiClientConfig _self;
  final $Res Function(_ApiClientConfig) _then;

/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? connectTimeout = null,Object? receiveTimeout = null,Object? sendTimeout = null,Object? defaultHeaders = null,Object? interceptors = null,Object? enableLogging = freezed,Object? cacheOptions = freezed,Object? certificatePinning = freezed,Object? maxRetries = null,Object? retryDelay = null,Object? retryableHttpMethods = null,Object? retryableStatusCodes = null,Object? followRedirects = null,Object? maxRedirects = null,Object? validateCertificates = null,}) {
  return _then(_ApiClientConfig(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,connectTimeout: null == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration,receiveTimeout: null == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration,sendTimeout: null == sendTimeout ? _self.sendTimeout : sendTimeout // ignore: cast_nullable_to_non_nullable
as Duration,defaultHeaders: null == defaultHeaders ? _self._defaultHeaders : defaultHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>,interceptors: null == interceptors ? _self._interceptors : interceptors // ignore: cast_nullable_to_non_nullable
as List<Interceptor>,enableLogging: freezed == enableLogging ? _self.enableLogging : enableLogging // ignore: cast_nullable_to_non_nullable
as bool?,cacheOptions: freezed == cacheOptions ? _self.cacheOptions : cacheOptions // ignore: cast_nullable_to_non_nullable
as CacheOptions?,certificatePinning: freezed == certificatePinning ? _self.certificatePinning : certificatePinning // ignore: cast_nullable_to_non_nullable
as CertificatePinningConfig?,maxRetries: null == maxRetries ? _self.maxRetries : maxRetries // ignore: cast_nullable_to_non_nullable
as int,retryDelay: null == retryDelay ? _self.retryDelay : retryDelay // ignore: cast_nullable_to_non_nullable
as Duration,retryableHttpMethods: null == retryableHttpMethods ? _self._retryableHttpMethods : retryableHttpMethods // ignore: cast_nullable_to_non_nullable
as Set<String>,retryableStatusCodes: null == retryableStatusCodes ? _self._retryableStatusCodes : retryableStatusCodes // ignore: cast_nullable_to_non_nullable
as Set<int>,followRedirects: null == followRedirects ? _self.followRedirects : followRedirects // ignore: cast_nullable_to_non_nullable
as bool,maxRedirects: null == maxRedirects ? _self.maxRedirects : maxRedirects // ignore: cast_nullable_to_non_nullable
as int,validateCertificates: null == validateCertificates ? _self.validateCertificates : validateCertificates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ApiClientConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CertificatePinningConfigCopyWith<$Res>? get certificatePinning {
    if (_self.certificatePinning == null) {
    return null;
  }

  return $CertificatePinningConfigCopyWith<$Res>(_self.certificatePinning!, (value) {
    return _then(_self.copyWith(certificatePinning: value));
  });
}
}

/// @nodoc
mixin _$CertificatePinningConfig implements DiagnosticableTreeMixin {

/// List of allowed SHA-256 certificate fingerprints
 List<String> get allowedSHA256Fingerprints;/// Hostname patterns to apply pinning to (e.g., ['*.example.com',
/// 'api.example.com'])
 List<String> get hostPatterns;
/// Create a copy of CertificatePinningConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificatePinningConfigCopyWith<CertificatePinningConfig> get copyWith => _$CertificatePinningConfigCopyWithImpl<CertificatePinningConfig>(this as CertificatePinningConfig, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CertificatePinningConfig'))
    ..add(DiagnosticsProperty('allowedSHA256Fingerprints', allowedSHA256Fingerprints))..add(DiagnosticsProperty('hostPatterns', hostPatterns));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificatePinningConfig&&const DeepCollectionEquality().equals(other.allowedSHA256Fingerprints, allowedSHA256Fingerprints)&&const DeepCollectionEquality().equals(other.hostPatterns, hostPatterns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allowedSHA256Fingerprints),const DeepCollectionEquality().hash(hostPatterns));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CertificatePinningConfig(allowedSHA256Fingerprints: $allowedSHA256Fingerprints, hostPatterns: $hostPatterns)';
}


}

/// @nodoc
abstract mixin class $CertificatePinningConfigCopyWith<$Res>  {
  factory $CertificatePinningConfigCopyWith(CertificatePinningConfig value, $Res Function(CertificatePinningConfig) _then) = _$CertificatePinningConfigCopyWithImpl;
@useResult
$Res call({
 List<String> allowedSHA256Fingerprints, List<String> hostPatterns
});




}
/// @nodoc
class _$CertificatePinningConfigCopyWithImpl<$Res>
    implements $CertificatePinningConfigCopyWith<$Res> {
  _$CertificatePinningConfigCopyWithImpl(this._self, this._then);

  final CertificatePinningConfig _self;
  final $Res Function(CertificatePinningConfig) _then;

/// Create a copy of CertificatePinningConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowedSHA256Fingerprints = null,Object? hostPatterns = null,}) {
  return _then(_self.copyWith(
allowedSHA256Fingerprints: null == allowedSHA256Fingerprints ? _self.allowedSHA256Fingerprints : allowedSHA256Fingerprints // ignore: cast_nullable_to_non_nullable
as List<String>,hostPatterns: null == hostPatterns ? _self.hostPatterns : hostPatterns // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificatePinningConfig].
extension CertificatePinningConfigPatterns on CertificatePinningConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificatePinningConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificatePinningConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificatePinningConfig value)  $default,){
final _that = this;
switch (_that) {
case _CertificatePinningConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificatePinningConfig value)?  $default,){
final _that = this;
switch (_that) {
case _CertificatePinningConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> allowedSHA256Fingerprints,  List<String> hostPatterns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificatePinningConfig() when $default != null:
return $default(_that.allowedSHA256Fingerprints,_that.hostPatterns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> allowedSHA256Fingerprints,  List<String> hostPatterns)  $default,) {final _that = this;
switch (_that) {
case _CertificatePinningConfig():
return $default(_that.allowedSHA256Fingerprints,_that.hostPatterns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> allowedSHA256Fingerprints,  List<String> hostPatterns)?  $default,) {final _that = this;
switch (_that) {
case _CertificatePinningConfig() when $default != null:
return $default(_that.allowedSHA256Fingerprints,_that.hostPatterns);case _:
  return null;

}
}

}

/// @nodoc


class _CertificatePinningConfig with DiagnosticableTreeMixin implements CertificatePinningConfig {
  const _CertificatePinningConfig({required final  List<String> allowedSHA256Fingerprints, final  List<String> hostPatterns = const ['*']}): _allowedSHA256Fingerprints = allowedSHA256Fingerprints,_hostPatterns = hostPatterns;
  

/// List of allowed SHA-256 certificate fingerprints
 final  List<String> _allowedSHA256Fingerprints;
/// List of allowed SHA-256 certificate fingerprints
@override List<String> get allowedSHA256Fingerprints {
  if (_allowedSHA256Fingerprints is EqualUnmodifiableListView) return _allowedSHA256Fingerprints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedSHA256Fingerprints);
}

/// Hostname patterns to apply pinning to (e.g., ['*.example.com',
/// 'api.example.com'])
 final  List<String> _hostPatterns;
/// Hostname patterns to apply pinning to (e.g., ['*.example.com',
/// 'api.example.com'])
@override@JsonKey() List<String> get hostPatterns {
  if (_hostPatterns is EqualUnmodifiableListView) return _hostPatterns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hostPatterns);
}


/// Create a copy of CertificatePinningConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificatePinningConfigCopyWith<_CertificatePinningConfig> get copyWith => __$CertificatePinningConfigCopyWithImpl<_CertificatePinningConfig>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CertificatePinningConfig'))
    ..add(DiagnosticsProperty('allowedSHA256Fingerprints', allowedSHA256Fingerprints))..add(DiagnosticsProperty('hostPatterns', hostPatterns));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificatePinningConfig&&const DeepCollectionEquality().equals(other._allowedSHA256Fingerprints, _allowedSHA256Fingerprints)&&const DeepCollectionEquality().equals(other._hostPatterns, _hostPatterns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allowedSHA256Fingerprints),const DeepCollectionEquality().hash(_hostPatterns));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CertificatePinningConfig(allowedSHA256Fingerprints: $allowedSHA256Fingerprints, hostPatterns: $hostPatterns)';
}


}

/// @nodoc
abstract mixin class _$CertificatePinningConfigCopyWith<$Res> implements $CertificatePinningConfigCopyWith<$Res> {
  factory _$CertificatePinningConfigCopyWith(_CertificatePinningConfig value, $Res Function(_CertificatePinningConfig) _then) = __$CertificatePinningConfigCopyWithImpl;
@override @useResult
$Res call({
 List<String> allowedSHA256Fingerprints, List<String> hostPatterns
});




}
/// @nodoc
class __$CertificatePinningConfigCopyWithImpl<$Res>
    implements _$CertificatePinningConfigCopyWith<$Res> {
  __$CertificatePinningConfigCopyWithImpl(this._self, this._then);

  final _CertificatePinningConfig _self;
  final $Res Function(_CertificatePinningConfig) _then;

/// Create a copy of CertificatePinningConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowedSHA256Fingerprints = null,Object? hostPatterns = null,}) {
  return _then(_CertificatePinningConfig(
allowedSHA256Fingerprints: null == allowedSHA256Fingerprints ? _self._allowedSHA256Fingerprints : allowedSHA256Fingerprints // ignore: cast_nullable_to_non_nullable
as List<String>,hostPatterns: null == hostPatterns ? _self._hostPatterns : hostPatterns // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
