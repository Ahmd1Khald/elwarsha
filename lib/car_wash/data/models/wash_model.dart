import 'package:elwarsha/car_wash/data/models/wash_data_model.dart';

import '../../domain/entities/wash_entity.dart';

class WashModel extends WashEntity {
  WashModel({
    required super.message,
    required super.order,
  });

  factory WashModel.fromJson(Map<String, dynamic> json) => WashModel(
    message: json["message"],
    order: WashDataModel.fromJson(json['order']),
  );

}
