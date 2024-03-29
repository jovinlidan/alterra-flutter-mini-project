import 'package:dio/dio.dart';

enum ApiStatus { success, loading, error }

class ApiResponse<T> {
  late T? data;
  late ApiStatus status;
  late String? message;

  ApiResponse({this.data, required this.status, this.message});
}

class Services {
  static Dio? _dio;

  Services._internal() {
    // ignore: prefer_conditional_assignment
    if (_dio == null) {
      // Jika instance belum ada, maka lakukan inisialisasi
      _dio = Dio(
        BaseOptions(
            baseUrl:
                'https://api.kontenbase.com/query/api/v1/cfb8a0ee-76a9-4dd2-9446-ac0c535cfef1/'),
      );
    }
  }
  factory Services() {
    return Services._internal();
  }

  Future<dynamic>? get({required String url}) async {
    Response<dynamic>? res = await _dio?.get(url);
    return Future.value(res?.data);
  }

  Future<dynamic>? post<T>({required String url, required T data}) async {
    Response<dynamic>? res = await _dio?.post(url, data: data);
    return Future.value(res?.data);
  }
}
