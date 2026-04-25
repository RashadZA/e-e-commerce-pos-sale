import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

part 'logging_interceptor.dart';

class ApiInterceptor implements Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _attachAuthToken(options);
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  Future<void> _attachAuthToken(RequestOptions options) async {
    final bool requiresToken = options.extra['requiresToken'] == true;
    final bool requiresHotelId = options.extra['tokenWithHotelId'] == true;

    options.extra.remove('requiresToken');
    options.extra.remove('tokenWithHotelId');

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    if (!requiresToken) return;

    final token = await getToken();
    options.headers['Authorization'] = 'Bearer $token';

    if (requiresHotelId) {
      final hotelId = await getClinicId();
      if (hotelId.isNotEmpty) {
        options.headers['x-hotel-id'] = hotelId;
      }
    }

    debugPrint("options.headers: ${options.headers}");
  }


}

