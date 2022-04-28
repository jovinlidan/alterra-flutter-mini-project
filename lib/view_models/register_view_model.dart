import 'package:dio/dio.dart';
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
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await AuthAPI.register(input: input);
      changeState(ApiResponse<TokenResult>(data: res, status: ApiStatus.success));
    } catch (e) {
      if (e is DioError) {
        changeState(ApiResponse(
            status: ApiStatus.error,
            message:
                (e.response?.data ?? {'message': e.message} as dynamic)['message'] as dynamic));
      } else {
        changeState(ApiResponse(status: ApiStatus.error, message: "Error!!!"));
      }
    }
  }
}
