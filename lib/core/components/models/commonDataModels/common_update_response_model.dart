import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CommonUpdateResponseModel  {
  int? status;
  String? message;
  CommonUpdateDataModel? data;

  CommonUpdateResponseModel ({this.status, this.message, this.data});

  CommonUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    status = json[statusString];
    message = json[messageString];
    data = json[dataString] != null ? CommonUpdateDataModel.fromJson(json[dataString]) : null;
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
class CommonUpdateDataModel {
  String? message;

  CommonUpdateDataModel({this.message});

  CommonUpdateDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}