import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RegisterRole { client, coach }

class RoleProvider extends StateNotifier<RegisterRole> {
  RoleProvider() : super(RegisterRole.client);

  void setRole(RegisterRole role) {
    state = role;
  }

  RegisterRole get role => state;
}
