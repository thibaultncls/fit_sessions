import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError() = _ServerError;
  const factory Failure.cacheError() = _CacheError;
  const factory Failure.validationError(String message) = _ValidationError;
  const factory Failure.unauthorized() = _Unauthorized;
}
