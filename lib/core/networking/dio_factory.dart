import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/services/locale/local_helper.dart';
import 'package:bookia_app/core/utils/app_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;
  // static inti() {
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: ApiEndpoints.baseUrl,
  //       headers: {
  //         "accept": "application/json",
  //         "content-Type": "application/json",
  //         "authorization":
  //             "Bearer ${LocalHelper.prefs?.get(AppConst.userToken)}",
  //       },
  //     ),
  //   );
  //   dio?.interceptors.add(
  //     PrettyDioLogger(
  //       requestHeader: true,
  //       requestBody: true,
  //       responseBody: true,
  //       responseHeader: false,
  //       error: true,
  //       compact: true,
  //       maxWidth: 90,
  //       enabled: kDebugMode,
  //       filter: (options, args) {
  //         // don't print requests with uris containing '/posts'
  //         if (options.path.contains('/posts')) {
  //           return false;
  //         }
  //         // don't print responses with unit8 list data
  //         return !args.isResponse || !args.hasUint8ListData;
  //       },
  //     ),
  //   );
  // }

  static void inti() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          "accept": "application/json",
          "content-Type": "application/json",
        },
      ),
    );

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = LocalHelper.prefs?.get(AppConst.userToken);

          if (token != null && token.toString().isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
            debugPrint('AUTH WARNING: Token is missing');
          }

          handler.next(options);
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }
}
