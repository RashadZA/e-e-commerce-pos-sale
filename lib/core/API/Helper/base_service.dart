import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/API/Helper/diox.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

part 'api_exceptions.dart';

mixin BaseService {
  final Dio dio = DioX().getDio(baseUrl)
    ..options.connectTimeout = const Duration(seconds: 30) // 30 seconds for connection
    ..options.receiveTimeout = const Duration(seconds: 30) // 30 seconds for response
    ..options.sendTimeout = const Duration(seconds: 30);   // 30 seconds for sending


  final Dio dioForCountry = DioX().getDio(countryUrl)
    ..options.connectTimeout = const Duration(seconds: 30) // 30 seconds for connection
    ..options.receiveTimeout = const Duration(seconds: 30) // 30 seconds for response
    ..options.sendTimeout = const Duration(seconds: 30);   // 30 seconds for sending

  final Map<String, dynamic> requiresToken = {
    "requiresToken": true,
  };

  final Map<String, dynamic> requiresTokenWithHotelId = {
    "requiresToken": true,
    "tokenWithHotelId": true,
  };

  final Map<String, dynamic> requiresPlanToken = {
    "requiresToken": true,
    "requiresPlanToken": true,
  };


  Future<T> tryOrCatch<T>(Future<T> Function() methodToRun) async {
    try {
      return await methodToRun();
    } on ApiException {
      rethrow;
    } on DioException catch (err) {
      throw ApiException(getErrorMessageForDioErrors(err), '', err.response);
    } catch (e, trace) {
      debugPrint("$e\n$trace");
      throw ApiException("Internal Error occurred, please try again later! 😭", "Default Exception: ", null);
    }
  }
}