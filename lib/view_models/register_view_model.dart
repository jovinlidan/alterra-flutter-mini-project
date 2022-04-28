import 'package:flutter/material.dart';
import 'package:mini_project/model/api/auth_api.dart';
import 'package:mini_project/model/auth_model.dart';
import 'package:mini_project/services/services.dart';

class RegisterViewModel extends ChangeNotifier {
  ApiResponse<TokenResult>? _token = ApiResponse(status: ApiStatus.success);

  ApiResponse<TokenResult>? get token => _token;

  void changeState(ApiResponse<TokenResult>? state) {
    _token = state;
    notifyListeners();
  }

  Future<void> register({required RegisterInput input}) async {
    changeState(ApiResponse(status: ApiStatus.loading));
    final res = await AuthAPI.register(input: input);
    changeState(ApiResponse<TokenResult>(data: res, status: ApiStatus.success));
  }
}
