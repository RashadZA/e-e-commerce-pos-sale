import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CommonResponseModelForPostApiCall {
  int? status;
  String? message;
  dynamic data;

  CommonResponseModelForPostApiCall({this.status, this.message, this.data});

  CommonResponseModelForPostApiCall.fromJson(Map<String, dynamic> json) {
    status = json[statusString];
    message = json[messageString];
    data = json[dataString];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[statusString] = status;
    data[messageString] = message;
    if (this.data != null) {
      data[dataString] = this.data!.toJson();
    }
    return data;
  }
}