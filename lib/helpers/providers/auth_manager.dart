import 'package:flutter/material.dart';
import 'package:mini_project/services/local_storage.dart';

const tokenKey = "auth_token";

class AuthManager with ChangeNotifier {
  Future<void> setToken({required String token}) async {
    LocalStorage ls = LocalStorage();
    await ls.set(spKey: tokenKey, data: token);
  }

  Future<String?> getToken() async {
    LocalStorage ls = LocalStorage();
    return await Future.value(ls.get(spKey: tokenKey));
  }
}
