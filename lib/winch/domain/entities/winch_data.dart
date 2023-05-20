import 'package:equatable/equatable.dart';

class WinchData extends Equatable {
  final int userId;
  final int serviceId;
  final String type;
  final String carType;
  final String cityFrom;
  final String cityTo;
  final double lag_from;
  final double lat_from;
  final double lag_to;
  final double lat_to;
  final String payment;
  final int status;
  final String description;
  final String updated_at;
  final String created_at;
  final int id;

  WinchData({
    required this.userId,
    required this.serviceId,
    required this.type,
    required this.carType,
    required this.cityFrom,
    required this.cityTo,
    required this.lag_from,
    required this.lat_from,
    required this.lag_to,
    required this.lat_to,
    required this.payment,
    required this.status,
    required this.description,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  @override
  List<Object> get props =>
      [
        userId,
        serviceId,
        type,
        carType,
        cityFrom,
        cityTo,
        lag_from,
        lat_from,
        lag_to,
        lat_to,
        payment,
        status,
        description,
        updated_at,
        created_at,
        id,
      ];
}

