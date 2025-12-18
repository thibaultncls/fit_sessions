import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({required String uid, required String email, required String name}) =
      _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, Object?> json) => _$AuthUserModelFromJson(json);
}
