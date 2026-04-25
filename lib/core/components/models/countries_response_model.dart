import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CountriesDetailsResponseModel {
  String? message;
  int? status;
  List<CountryDetailsDataModel>? data;

  CountriesDetailsResponseModel({this.message, this.status, this.data});

  CountriesDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json[messageString];
    status = json[statusString];
    if (json[dataString] != null) {
      data = <CountryDetailsDataModel>[];
      transformCountries(json[dataString]).forEach((v) {
        data!.add(CountryDetailsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[messageString] = message;
    data[statusString] = status;
    if (this.data != null) {
      data[dataString] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryDetailsDataModel {
  CountryFlagDataModel? flags;
  CountryNameDataModel? name;
  List<CountryCurrencyDataModel>? currencies;

  CountryDetailsDataModel({this.flags, this.name, this.currencies});

  CountryDetailsDataModel.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? CountryFlagDataModel.fromJson(json['flags']) : null;
    name = json['name'] != null ? CountryNameDataModel.fromJson(json['name']) : null;
    if (json['currencies'] != null) {
      currencies = <CountryCurrencyDataModel>[];
      json['currencies'].forEach((v) {
        currencies!.add(CountryCurrencyDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryFlagDataModel {
  String? png;
  String? svg;
  String? alt;

  CountryFlagDataModel({this.png, this.svg, this.alt});

  CountryFlagDataModel.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
    return data;
  }
}

class CountryNameDataModel {
  String? common;
  String? official;
  List<CountryNativeNameDataModel>? nativeNames;

  CountryNameDataModel({this.common, this.official, this.nativeNames});

  CountryNameDataModel.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    if (json['nativeNames'] != null) {
      nativeNames = <CountryNativeNameDataModel>[];
      json['nativeNames'].forEach((v) {
        nativeNames!.add(CountryNativeNameDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeNames != null) {
      data['nativeNames'] = nativeNames!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class CountryNativeNameDataModel {
  String? key;
  String? official;
  String? common;

  CountryNativeNameDataModel({this.key, this.official, this.common});

  CountryNativeNameDataModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class CountryCurrencyDataModel {
  String? key;
  String? name;
  String? symbol;

  CountryCurrencyDataModel({this.key, this.name, this.symbol});

  CountryCurrencyDataModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

List<Map<String, dynamic>> transformCountries(List<dynamic> apiResponse) {
  return apiResponse.map<Map<String, dynamic>>((country) {
    return {
      "flags": country['flags'],
      "name": {
        "common": country['name']?['common'],
        "official": country['name']?['official'],
        "nativeNames": _resolveNativeNames(
          country['name']?['nativeName'] as Map<String, dynamic>?,
        ),
      },
      "currencies": _resolveCurrencies(
        country['currencies'] as Map<String, dynamic>?,
      ),
    };
  }).toList();
}

List<Map<String, dynamic>> _resolveNativeNames(
    Map<String, dynamic>? nativeNameMap,
    ) {
  if (nativeNameMap == null || nativeNameMap.isEmpty) return [];

  return nativeNameMap.entries.map((entry) {
    final value = entry.value as Map<String, dynamic>;
    return {
      'key': entry.key,
      'official': value['official'],
      'common': value['common'],
    };
  }).toList();
}

List<Map<String, dynamic>> _resolveCurrencies(
    Map<String, dynamic>? currencyMap,
    ) {
  if (currencyMap == null || currencyMap.isEmpty) return [];

  return currencyMap.entries.map((entry) {
    final value = entry.value as Map<String, dynamic>;
    return {
      'key': entry.key,
      'name': value['name'],
      'symbol': value['symbol'],
    };
  }).toList();
}
