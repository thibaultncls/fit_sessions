import 'package:fit_sessions/core/common/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({required String uid, required String email, required String name}) =
      _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, Object?> json) => _$AuthUserModelFromJson(json);
}

extension AuthUserModelMapper on AuthUserModel {
  User toEntity() => User(uid: uid, email: email, name: name);
}

extension AuthUserEntityMapper on User {
  AuthUserModel toModel() => AuthUserModel(uid: uid, email: email, name: name);
}
