import 'package:e_commerce_pos_sale/core/API/Service/api_call.dart';
import 'package:e_commerce_pos_sale/core/components/models/countries_response_model.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APIRepository {
  final APICall apiCall = Get.put(APICall());

  /// Login API countriesDetailsResponse
  Future<CountriesDetailsResponseModel> countriesDetailsResponse() async {
    try {
      return await apiCall.countriesDetailsResponse();
    } catch (e) {
      debugPrint("countriesDetailsResponse error: ${e.toString()}");
      return CountriesDetailsResponseModel.fromJson({
        statusString: 500,
        messageString: e.toString(),
      });
    }
  }

}