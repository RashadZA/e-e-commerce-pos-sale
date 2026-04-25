import 'dart:async';

import 'package:e_commerce_pos_sale/core/API/Helper/base_service.dart';
import 'package:e_commerce_pos_sale/core/components/models/countries_response_model.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class APICall with BaseService {
  void dispose() {}

  /// API call for Countries Details
  FutureOr<CountriesDetailsResponseModel> countriesDetailsResponse() async {
    return tryOrCatch<CountriesDetailsResponseModel>(() async {
      final response = await dioForCountry.get("");
      return CountriesDetailsResponseModel.fromJson({
        statusString: response.statusCode,
        messageString: response.statusMessage,
        dataString: response.data,
      });
    });
  }
}