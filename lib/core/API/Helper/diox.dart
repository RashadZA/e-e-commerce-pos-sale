import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:e_commerce_pos_sale/core/API/Helper/api_interceptor.dart';

class DioX {
  DioX._();
  factory DioX() => _internal;
  static final DioX _internal = DioX._();

  Dio _dio(String baseUrl) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: ContentType.json.mimeType,
        ),
      );

  Dio getDio(String baseUrl) {
    final interceptors = [
      ApiInterceptor(),
      if (!kReleaseMode) LoggingInterceptor(),
    ];

    return _dio(baseUrl)..interceptors.addAll(interceptors);
  }
}