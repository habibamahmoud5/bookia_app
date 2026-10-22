import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static Dio? dio;
  static inti() {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
  }
}
