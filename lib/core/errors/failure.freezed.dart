// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerError value)?  serverError,TResult Function( _CacheError value)?  cacheError,TResult Function( _ValidationError value)?  validationError,TResult Function( _Unauthorized value)?  unauthorized,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _CacheError() when cacheError != null:
return cacheError(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerError value)  serverError,required TResult Function( _CacheError value)  cacheError,required TResult Function( _ValidationError value)  validationError,required TResult Function( _Unauthorized value)  unauthorized,}){
final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that);case _CacheError():
return cacheError(_that);case _ValidationError():
return validationError(_that);case _Unauthorized():
return unauthorized(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerError value)?  serverError,TResult? Function( _CacheError value)?  cacheError,TResult? Function( _ValidationError value)?  validationError,TResult? Function( _Unauthorized value)?  unauthorized,}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _CacheError() when cacheError != null:
return cacheError(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  serverError,TResult Function()?  cacheError,TResult Function( String message)?  validationError,TResult Function()?  unauthorized,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError();case _CacheError() when cacheError != null:
return cacheError();case _ValidationError() when validationError != null:
return validationError(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  serverError,required TResult Function()  cacheError,required TResult Function( String message)  validationError,required TResult Function()  unauthorized,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError();case _CacheError():
return cacheError();case _ValidationError():
return validationError(_that.message);case _Unauthorized():
return unauthorized();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  serverError,TResult? Function()?  cacheError,TResult? Function( String message)?  validationError,TResult? Function()?  unauthorized,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError();case _CacheError() when cacheError != null:
return cacheError();case _ValidationError() when validationError != null:
return validationError(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized();case _:
  return null;

}
}

}

/// @nodoc


class _ServerError implements Failure {
  const _ServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serverError()';
}


}




/// @nodoc


class _CacheError implements Failure {
  const _CacheError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cacheError()';
}


}




/// @nodoc


class _ValidationError implements Failure {
  const _ValidationError(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationErrorCopyWith<_ValidationError> get copyWith => __$ValidationErrorCopyWithImpl<_ValidationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.validationError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ValidationErrorCopyWith(_ValidationError value, $Res Function(_ValidationError) _then) = __$ValidationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ValidationErrorCopyWithImpl<$Res>
    implements _$ValidationErrorCopyWith<$Res> {
  __$ValidationErrorCopyWithImpl(this._self, this._then);

  final _ValidationError _self;
  final $Res Function(_ValidationError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ValidationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unauthorized implements Failure {
  const _Unauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unauthorized()';
}


}




// dart format on
