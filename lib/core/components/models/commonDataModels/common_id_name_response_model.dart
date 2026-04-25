import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CommonIdNameResponseModel {
  int? status;
  String? message;
  List<CommonIdNameDataModel>? data;

  CommonIdNameResponseModel({this.status,this.data,this.message,});

  CommonIdNameResponseModel.fromJson(Map<String, dynamic> json) {
    message = json[messageString];
    status = json[statusString];
    if (json[dataString] != null) {
      data = <CommonIdNameDataModel>[];
      json[dataString].forEach((v) {
        data!.add(CommonIdNameDataModel.fromJson(v));
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

class CommonIdNameDataModel {
  String? id;
  String? name;

  CommonIdNameDataModel({this.id, this.name});

  CommonIdNameDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}