import 'package:dartz/dartz.dart';
import 'package:elwarsha/winch/domain/entities/winch_entity.dart';

import '../../../core/exceptions/failure.dart';

abstract class BaseWinchRepository {
  Future<Either<Failure, WinchEntity>> makeWinchOrder(
    int serviceID,
    String carType,
    double lagFrom,
    double latFrom,
    double lagTo,
    double latTo,
    String payment,
    String description,
      String cityFrom,
      String cityTo,
  );
}
